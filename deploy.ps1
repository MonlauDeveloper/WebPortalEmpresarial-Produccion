# Configuration
$SERVER_IP = "212.227.227.190"
$USER = "root"
$REMOTE_PATH = "/var/www/vhosts/alumnes-monlau.com/portalempresarial.alumnes-monlau.com"
$ZIP_NAME = "deploy.zip"

Write-Host "--- Portal Empresarial Deployment Script ---" -ForegroundColor Cyan
Write-Host "1. Zipping project files..." -ForegroundColor Yellow

# Remove old zip if exists
if (Test-Path $ZIP_NAME) { Remove-Item $ZIP_NAME }

# Remove public/storage directory if it exists to avoid compression issues
$publicStoragePath = "public\storage"
$publicStorageExisted = $false
if (Test-Path $publicStoragePath) {
    Write-Host "Removing public\storage directory temporarily..." -ForegroundColor Yellow
    Remove-Item -Path $publicStoragePath -Recurse -Force
    $publicStorageExisted = $true
}

try {
    # Zip files request (excluding huge/unnecessary folders)
    # We include vendor to avoid running composer on server, but exclude node_modules
    $exclude = @("node_modules", ".git", ".env", $ZIP_NAME, "storage/*.key", ".idea", ".vscode")
    Get-ChildItem -Path . -Exclude $exclude | Compress-Archive -DestinationPath $ZIP_NAME -Force
    Write-Host "Project files zipped successfully." -ForegroundColor Green
} finally {
    # Recreate public/storage directory if it existed
    if ($publicStorageExisted) {
        New-Item -ItemType Directory -Path $publicStoragePath -Force | Out-Null
        Write-Host "Recreated public\storage directory." -ForegroundColor Green
    }
}

Write-Host "2. Uploading $ZIP_NAME to server..." -ForegroundColor Yellow
Write-Host "   (You will be asked for the password: 3Q7ZQJ&q#$)" -ForegroundColor Magenta
scp $ZIP_NAME ${USER}@${SERVER_IP}:${REMOTE_PATH}/$ZIP_NAME

if ($LASTEXITCODE -ne 0) {
    Write-Error "Upload failed. Please check your password and try again."
    exit
}

Write-Host "3. Connecting to server to cleanup and unzip..." -ForegroundColor Yellow
Write-Host "   (You will be asked for the password again)" -ForegroundColor Magenta

# Remote commands - using semicolons to separate commands for Unix
$commands = @"
cd $REMOTE_PATH && \
if [ -f .env ]; then cp .env .env.bak; else echo 'Warning: .env file does not exist'; fi && \
echo '--> Cleaning old files' && \
find . -maxdepth 1 ! -name 'deploy.zip' ! -name '.env.bak' ! -name '.' ! -name '..' -type f -delete && \
find . -maxdepth 1 ! -name 'deploy.zip' ! -name '.env.bak' ! -name '.' ! -name '..' -type d -exec rm -rf {} + 2>/dev/null; \
echo '--> Unzipping new code' && \
unzip -o deploy.zip && \
if [ -f .env.bak ]; then mv .env.bak .env; fi && \
echo '--> Setting Permissions' && \
chmod -R 775 storage bootstrap/cache 2>/dev/null; \
chown -R fastparty:psacln . 2>/dev/null; \
echo '--> Linking storage' && \
php artisan storage:link && \
echo '--> Cleaning up' && \
rm -f deploy.zip && \
echo 'DEPLOYMENT COMPLETE!'
"@

# Convert Windows line endings to Unix line endings
$commands = $commands -replace "`r`n", "`n"

ssh ${USER}@${SERVER_IP} $commands

Write-Host "4. Checking deployment status..." -ForegroundColor Yellow

# Check logs and status
$statusCommands = @"
cd $REMOTE_PATH && \
echo '=== Checking .env file ===' && \
test -f .env && echo '.env exists' || echo 'WARNING: .env NOT FOUND' && \
echo '' && \
echo '=== Checking recent Laravel errors ===' && \
tail -20 storage/logs/laravel.log 2>/dev/null || echo 'No log file found' && \
echo '' && \
echo '=== Checking file permissions ===' && \
ls -la storage/logs/ 2>/dev/null | head -5 || echo 'Cannot access logs directory'
"@

$statusCommands = $statusCommands -replace "`r`n", "`n"
ssh ${USER}@${SERVER_IP} $statusCommands

Write-Host "Done!" -ForegroundColor Green
