# 2011 iMac Update Tools

This repository contains guides and scripts to help update 2011 iMac computers using OpenCore Legacy Patcher (OCLP).

## Contents

- [Update Guide](OCLP-Update-Guide.md) - Comprehensive instructions for updating macOS on a 2011 iMac
- [Update Script](update_mac.sh) - Interactive bash script to assist with the update process

## System Requirements

- 2011 iMac (27" or 21.5")
- macOS already installed with OpenCore Legacy Patcher
- Time Machine backup available

## How to Use

1. Clone this repository to your iMac
2. Read through the [Update Guide](OCLP-Update-Guide.md) to understand the process
3. Make the script executable: `chmod +x update_mac.sh`
4. Run the script: `./update_mac.sh`
5. Follow the interactive prompts

## Safety First

Always ensure you have a complete Time Machine backup before performing any system updates or modifications. The script will remind you of this, but it's critical for data safety.

## Contributing

Feel free to submit issues or pull requests if you have improvements or suggestions for this guide and script.

## License

This project is released under the MIT License. See the [LICENSE](LICENSE) file for details.
