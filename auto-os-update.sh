#!/bin/bash

# Logging function
log_info() {
  echo "[INFO] $(date) - $1"
}

log_error() {
  echo "[ERROR] $(date) - $1" >&2
}

# OS Detection
detect_os() {
  if command -v apt-get &> /dev/null; then
    OS="debian"
    log_info "Detected Debian/Ubuntu."
  elif command -v yum &> /dev/null; then
    OS="centos"
    log_info "Detected CentOS/RHEL."
  elif command -v dnf &> /dev/null; then
    OS="fedora"
    log_info "Detected Fedora."
  else
    log_error "Unsupported OS."
    exit 1
  fi
}

# Update and Upgrade
update_system() {
  case "$OS" in
    debian)
      log_info "Updating Debian/Ubuntu system..."
      apt-get update -y
      apt-get upgrade -y
      apt-get dist-upgrade -y
      apt-get autoremove -y
      ;;
    centos|fedora)
      log_info "Updating CentOS/RHEL/Fedora system..."
      if [ "$OS" = "centos" ]; then
        yum update -y
      else
        dnf update -y
      fi
      ;;
    *)
      log_error "No update method defined for OS: $OS"
      exit 1
      ;;
  esac
  log_info "Update complete."
}

# Main script
main() {
  # Check if running as root
  if [ "$EUID" -ne 0 ]; then
    log_error "This script must be run as root."
    exit 1
  fi

  detect_os
  update_system
}

main
exit 0
