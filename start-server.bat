@echo off
title Portfolio preview — port 8080
cd /d "%~dp0"
set NODE=%LOCALAPPDATA%\Programs\cursor\resources\app\resources\helpers\node.exe
if not exist "%NODE%" (
    echo Cursor Node not found. Use Live Server in Cursor, or install Python and run: python -m http.server 8080
    pause
    exit /b 1
)
echo.
echo  Portfolio: %CD%
echo  Open:      http://localhost:8080
echo  Stop:      Ctrl+C or close this window
echo.
"%NODE%" -e "const http=require('http'),fs=require('fs'),path=require('path');const r=process.cwd().replace(/\\/g,'/'),t={'.html':'text/html; charset=utf-8','.css':'text/css','.js':'application/javascript','.svg':'image/svg+xml','.mp3':'audio/mpeg','.json':'application/json','.xml':'application/xml','.txt':'text/plain'};http.createServer((q,s)=>{let u=decodeURIComponent((q.url||'/').split('?')[0]);if(u==='/')u='/index.html';let p=path.join(process.cwd(),u.replace(/^\//,'').split('/').join(path.sep));if(!p.startsWith(process.cwd())){s.writeHead(403);return s.end();}fs.readFile(p,(e,d)=>{if(e){s.writeHead(404);return s.end('Not found');}s.writeHead(200,{'Content-Type':t[path.extname(p)]||'application/octet-stream'});s.end(d);});}).listen(8080,()=>console.log('Ready.'));"
pause
