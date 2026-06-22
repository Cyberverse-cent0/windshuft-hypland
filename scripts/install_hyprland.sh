#!/usr/bin/env bash
# Hyprland installation script

# Load print functions
source ../lib/print_function.sh

install_hyprland() {
    print_info "Installing Hyprland configuration..."
    
    # Check if Hyprland is installed
    if ! command -v hyprland &> /dev/null; then
        print_warning "Hyprland is not installed. Please install it first."
        return 1
    fi
    
    # Create config directory if it doesn't exist
    local config_dir="$HOME/.config/hypr"
    if [ ! -d "$config_dir" ]; then
        print_progress "Creating Hyprland config directory..."
        mkdir -p "$config_dir"
    fi
    
    # Backup existing config
    if [ -f "$config_dir/hyprland.conf" ]; then
        print_info "Backing up existing hyprland.conf..."
        mv "$config_dir/hyprland.conf" "$config_dir/hyprland.conf.backup"
    fi
    
    # Copy hyprland.lua configuration
    if [ -f "../hypr/hyprland.lua" ]; then
        print_progress "Copying hyprland.lua configuration..."
        cp "../hypr/hyprland.lua" "$config_dir/hyprland.lua"
        print_success "Hyprland configuration installed successfully"
    else
        print_error "hyprland.lua not found in hypr/ directory"
        return 1
    fi
}

# Run installation
install_hyprland
