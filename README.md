## Chrome Terminal (Headless) Stable in Docker

### Clone repo:
`git clone https://github.com/span-ru/chrome-terminal-stable`

### Build:
`docker build -t chrome-terminal-stable .`

### Run:
`docker run -dt --name chrome-stable -p 9222:9222 chrome-terminal-stable`