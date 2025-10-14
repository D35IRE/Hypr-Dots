const options = {
  theme: {
    // Pywal integration - these will be automatically populated by pywal
    bar: {
      outer_spacing: 8,
      buttons: {
        style: "default",
        monochrome: false,
        text_icon: false,
        icon_size: 18,
        spacing: 8,
        padding_x: 12,
        padding_y: 8,
        radius: 8,
      },
      floating: true,
      layer: "top",
      margin_top: 8,
      margin_bottom: 0,
      margin_sides: 8,
      border_radius: 12,
      transparent: false,
    },
    notification: {
      border_radius: 12,
      border_width: 2,
      margin: 8,
      opacity: 0.95,
    },
    osd: {
      enable: true,
      orientation: "vertical",
      location: "right",
      margin: 20,
      muted_zero: true,
      monitor: -1,
    },
  },

  // Color scheme from pywal
  colors: "$HOME/.cache/wal/colors-hyprpanel.scss",

  // Only enable notification panel
  bar: {
    layouts: {
      0: {
        left: [],
        middle: [],
        right: ["notifications"],
      },
    },
  },

  // Media player configuration
  media: {
    enable: true,
    show_active_only: false, // Show all media sources
    truncation: true,
    truncation_size: 25,
    max_widget_width: 300,
    show_label: true,
    show_time: true,
    preferred_player: "", // Let it auto-detect
    switch_players: true, // Enable switching between players
    layout: "horizontal", // Horizontal layout for side switching
  },

  // Notification panel configuration
  notifications: {
    enable: true,
    show_total: true,
    position: "top right",
    monitor: 0,
    timeout: 5000,
    cache_actions: true,
    display_time: true,
    
    // Panel specific settings
    panel: {
      width: 350,
      height: 600,
      margin: 10,
      
      // Media at top
      sections: {
        media: {
          enable: true,
          position: "top",
          show_controls: true,
          show_thumbnail: true,
          player_switch: "horizontal", // Side-by-side player switching
        },
        
        // Quick settings under media
        quicksettings: {
          enable: true,
          position: "middle-top",
          wifi: {
            enable: true,
            show_strength: true,
          },
          bluetooth: {
            enable: true,
            show_battery: true,
          },
          audio: {
            enable: true,
            show_percentage: true,
          },
          brightness: {
            enable: true,
            show_percentage: true,
          },
        },
        
        // DND toggle
        dnd: {
          enable: true,
          position: "middle",
        },
        
        // Notification stack
        notifications: {
          enable: true,
          position: "bottom",
          stack_limit: 5,
          show_clear_all: true,
          group_by_app: true,
        },
      },
    },
    
    // Individual notification settings
    notification: {
      border_radius: 8,
      margin: 4,
      timeout: 5000,
      actions: true,
    },
  },

  // OSD Configuration
  osd: {
    enable: true,
    location: "center right",
    orientation: "vertical",
    monitor: -1,
    timeout: 2000,
    
    volume: {
      enable: true,
      show_percentage: true,
      show_icon: true,
    },
    
    brightness: {
      enable: true,
      show_percentage: true,
      show_icon: true,
    },
    
    styling: {
      width: 60,
      height: 200,
      margin: 20,
      border_radius: 30,
      background_opacity: 0.8,
    },
  },

  // System controls configuration
  menus: {
    clock: {
      enable: false, // Disable since we're only using notifications
    },
    dashboard: {
      enable: false,
    },
    power: {
      enable: false,
    },
  },

  // Disable other modules we don't need
  workspaces: {
    enable: false,
  },
  
  windowtitle: {
    enable: false,
  },
  
  systray: {
    enable: false,
  },
  
  clock: {
    enable: false,
  },
  
  volume: {
    enable: false, // Using quick settings instead
  },
  
  network: {
    enable: false, // Using quick settings instead
  },
  
  bluetooth: {
    enable: false, // Using quick settings instead
  },
  
  brightness: {
    enable: false, // Using quick settings instead
  },
  
  battery: {
    enable: false,
  },
  
  // Custom CSS for pywal integration
  custom_modules: {
    pywal_integration: {
      exec: "cat $HOME/.cache/wal/colors-hyprpanel.css",
      format: "{}",
      interval: 5,
      on_click: "",
    },
  },
};

export { options };
