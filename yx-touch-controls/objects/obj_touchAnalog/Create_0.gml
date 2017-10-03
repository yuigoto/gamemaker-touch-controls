/// @description Define initial parameters for the touch analog

// Current index
_idx        = -1;

// Thumb position and max radius
thumb_x     = x;
thumb_y     = y;
thumb_r     = 16;
thumb_max   = thumb_r * 2;

// Max boundaries to check for mouse touch
bound_r     = thumb_r * 3.5;

// Deadzone
deadzone    = .25;

// Deadzone ratio multiplier
deadzone_r  = 1 - deadzone;
dead_min    = thumb_max * deadzone;

// Distance
dist        = 0;

// Touch position
touch_x     = 0;
touch_y     = 0;

// Initial down, press and "release" status
hold        = false;
press       = false;
release     = false;

// Horizontal/vertical axis' values (influenced by deadzone and radius): -1 ~ 1
h_pos       = 0;
v_pos       = 0;
