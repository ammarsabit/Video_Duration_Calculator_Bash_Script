# Video Duration Calculator Bash Script

This is a simple Bash script that calculates the **total duration** of all video files in a given folder. It supports any video file format that `ffprobe` can analyze (e.g., `.mp4`, `.mkv`, `.mov`, `.avi`, etc.).

## Features

- Automatically sums up the duration of all video files in a folder
- Accepts user input or command-line arguments
- Supports any video file extension
- Converts total duration to a human-readable format (hours, minutes, seconds)
- Lightweight and dependency-light (only needs `ffprobe`)

## 🛠️ Requirements

- **bash**
- **ffprobe** (comes with `ffmpeg`)

Install `ffmpeg` (if not already installed):

```bash
sudo apt install ffmpeg        # Debian/Ubuntu
brew install ffmpeg            # macOS
