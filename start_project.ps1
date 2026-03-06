# Navigate back to the root if we're in one of the subfolders
if ($PSScriptRoot) { $RootPath = $PSScriptRoot } else { $RootPath = "c:\Users\wwwka\OneDrive\Desktop\ABIMANYUAI-main" }
cd $RootPath

$env:Path += ";C:\Program Files\nodejs"
$env:Path += ";C:\Users\wwwka\AppData\Local\Programs\Python\Python312"
$env:Path += ";C:\Users\wwwka\AppData\Local\Programs\Python\Python312\Scripts"

Write-Host "Ensuring backend dependencies..." -ForegroundColor Green
cd backend
.\venv\Scripts\python.exe -m pip install PyJWT PyYAML pydantic[email] typing-extensions requests sqlalchemy python-dotenv fastapi uvicorn cryptography
# Add any missing ones found earlier
cd ..

Write-Host "Starting Backend..." -ForegroundColor Green
$BackendProcess = Start-Process -FilePath "powershell.exe" -ArgumentList "-NoExit -Command `$env:Path += ';C:\Program Files\nodejs'; cd backend; .\venv\Scripts\python.exe main.py" -PassThru

Write-Host "Starting Frontend..." -ForegroundColor Green
$FrontendProcess = Start-Process -FilePath "powershell.exe" -ArgumentList "-NoExit -Command `$env:Path += ';C:\Program Files\nodejs'; cd frontend; npm run dev" -PassThru

Write-Host "Both processes are starting in separate windows." -ForegroundColor Cyan
Write-Host "Backend: https://localhost:8000"
Write-Host "Frontend: https://localhost:8080 (or 8081 if occupied)"
