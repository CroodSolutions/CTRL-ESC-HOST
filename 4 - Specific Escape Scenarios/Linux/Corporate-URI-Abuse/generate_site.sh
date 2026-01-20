#!/bin/bash

# Setup for CityConnect Scenario - Site Generator
TARGET_HTML="$HOME/city_connect.html"

# Generate the Target Page
echo "[*] Generating CityConnect Portal at $TARGET_HTML..."
cat > "$TARGET_HTML" <<HTML
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CityConnect Public Terminal</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #ecf0f1; margin: 0; display: flex; flex-direction: column; align-items: center; height: 100vh; }
        .header { background-color: #2c3e50; color: white; width: 100%; padding: 25px 0; text-align: center; font-size: 2.5rem; font-weight: bold; box-shadow: 0 2px 5px rgba(0,0,0,0.2); }
        .main-container { flex: 1; display: flex; flex-direction: column; justify-content: center; align-items: center; width: 100%; }
        .card { background: white; padding: 50px; border-radius: 15px; box-shadow: 0 10px 25px rgba(0,0,0,0.1); text-align: center; max-width: 800px; width: 90%; }
        h2 { color: #2c3e50; margin-bottom: 30px; font-size: 2rem; }
        .btn-live { display: block; background-color: #e74c3c; color: white; text-decoration: none; padding: 25px; font-size: 1.8rem; border-radius: 8px; margin: 30px 0; font-weight: bold; transition: transform 0.2s, background-color 0.2s; box-shadow: 0 4px 6px rgba(0,0,0,0.2); }
        .btn-live:hover { background-color: #c0392b; transform: scale(1.02); }
        .secondary-links { margin-top: 40px; display: flex; justify-content: space-around; border-top: 1px solid #bdc3c7; padding-top: 30px; }
        .link-item { color: #2980b9; text-decoration: none; font-size: 1.2rem; padding: 10px 20px; border: 1px solid #ecf0f1; border-radius: 5px; transition: background 0.3s; }
        .link-item:hover { background-color: #ecf0f1; text-decoration: underline; }
        .footer { padding: 20px; color: #7f8c8d; font-size: 0.9rem; }
    </style>
</head>
<body>
    <div class="header">OFFICIAL PUBLIC ACCESS TERMINAL</div>
    <div class="main-container">
        <div class="card">
            <h2>Government Transparency Dashboard</h2>
            <p>Welcome to the City of Linutopia's official access portal.</p>
            
            <!-- THE TRAP -->
            <a href="rtsp://127.0.0.1/live_stream" class="btn-live">
                🔴 WATCH COUNCIL MEETING LIVE
            </a>

            <div class="secondary-links">
                <a href="webcal://127.0.0.1/trash.ics" class="link-item">📅 Sync Sanitation Schedule</a>
                <a href="help://gnome-help/access" class="link-item">❓ Accessibility Guide</a>
            </div>
        </div>
    </div>
    <div class="footer">Authorized Use Only • Monitored System • ID: KIOSK-LNX-04</div>
</body>
</html>
HTML

echo "[+] Site generated successfully."
echo "[+] You can preview it with: xdg-open $TARGET_HTML"
