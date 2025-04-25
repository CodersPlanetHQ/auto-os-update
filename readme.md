# auto-os-update: Automated OS Update Script

This script automatically detects the operating system of your VPS and performs update and upgrade operations using the appropriate package manager.

## Features

*   **OS Detection:** Automatically identifies the operating system (currently supports Debian/Ubuntu and CentOS/RHEL/Fedora).
*   **Automated Update & Upgrade:**  Performs update and upgrade operations using `apt` (for Debian/Ubuntu) or `yum`/`dnf` (for CentOS/RHEL/Fedora).
*   **Logging:** Logs actions to provide an audit trail.
*   **Non-Interactive:** Runs without requiring user input.

## Usage

1.  **Download the script:**

    ```bash
    wget https://raw.githubusercontent.com/CodersPlanetHQ/MinecraftServerSetup/main/auto-os-update.sh -O auto-os-update.sh
    ```

2.  **Make the script executable:**

    ```bash
    chmod +x auto-os-update.sh
    ```

3.  **Run the script as root:**

    ```bash
    sudo ./auto-os-update.sh
    ```

## Important Notes

*   **Run as Root:**  This script **must** be run as the root user (using `sudo`).
*   **Reboot if necessary:** The script does **not** automatically reboot the system, even if updates require it.  You may need to reboot manually after running the script.
*   **Testing:**  It is **highly recommended** to test this script on a non-production system before running it on a production server.
*   **Error Handling:** The script includes basic error handling, but it's essential to monitor the logs for any issues.
*   **Customization:**  You can customize the script to add additional steps, such as installing specific packages or configuring services.

## Contributing

Contributions are welcome! Please feel free to submit pull requests with improvements or bug fixes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Disclaimer

This script is provided as-is, without warranty of any kind. Use at your own risk. The author is not responsible for any damages caused by the use of this script.
