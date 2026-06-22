#!/usr/bin/env bash
# Developer codecrafter

# colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color


# Load main config
if [ -f "../main.conf" ]; then
    source "../main.conf"
else
    echo "Error: main.conf not found"
    exit 1
fi

log_info() {
    local message="$1"
    if [ -n "$LOG_FILE" ] && [ -f "$LOG_FILE" ]; then
        echo "[$(date +'%Y-%m-%d %H:%M:%S')] $message" >> "$LOG_FILE"
    fi
}

print_info() {
    local message="$1"
    # color is blue
    echo -e "${BLUE}[INFO] $message${NC}"
    if [ "$log_mode" = "true" ]; then
        log_info "$message"
    fi
}

print_error() {
    local message="$1"
    echo -e "${RED}[ERROR] $message${NC}" >&2
    if [ "$log_mode" = "true" ]; then
        log_info "$message"
    fi
}

print_warning() {
    local message="$1"
    # color is yellow
    echo -e "${YELLOW}[WARNING] $message${NC}"
    if [ "$log_mode" = "true" ]; then
        log_info "$message"
    fi
}

print_success() {
    local message="$1"
    # color is green
    echo -e "${GREEN}[SUCCESS] $message${NC}"
    if [ "$log_mode" = "true" ]; then
        log_info "$message"
    fi
}

print_progress() {
    local message="$1"
    echo -e "${GREEN}[PROGRESS] $message${NC}"
    if [ "$log_mode" = "true" ]; then
        log_info "$message"
    fi
}