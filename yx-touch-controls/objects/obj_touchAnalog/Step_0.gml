/// @description Updates the control state

// Checks if mobile or not
if ( os_type == os_android || os_type == os_ios ) {
    // Input ID and detected flag
    var dirs, 
        max_x, 
        max_y, 
        cuts;
    
    // Get direction and distance from X/Y
    var dirs    = point_direction( x, y, mouse_x, mouse_y ), 
        max_x   = lengthdir_x( thumb_r * 3, dirs ), 
        max_y   = lengthdir_y( thumb_r * 3, dirs );
        
    // First, check all the touch inputs (5 total)
    for ( var i = 0; i <= 4; i++ ) {
        // Temporary position
        var temp_x  = device_mouse_x( i ), 
            temp_y  = device_mouse_y( i );
        
        // Initial break value
        cuts    = false;
        
        // Comparing ID and index
        with ( obj_touchAnalog ) {
            // If current loop is this object, continues
            if ( id == other.id ) continue;
            
            // If ID is different and index is == i
            if ( id != other.id && _idx == i ) {
                // Sets to break this check and continue loop
                cuts = true;
                // Breaks this loop
                break;
            }
        }
        
        // Breaks check below and proceeds to next loop
        if ( cuts ) continue;
        
        // Check for press and hold
        if ( 
            temp_x >= x - bound_r 
            && temp_x <= x + bound_r 
            && temp_y >= y - bound_r 
            && temp_y <= y + bound_r 
            && (
                device_mouse_check_button( i, mb_left )
                || device_mouse_check_button_pressed( i, mb_left ) 
                || device_mouse_check_button_released( i, mb_left ) 
            ) 
        ) {
            // Set index
            _idx    = i;
        
            // Get direction and distance from X/Y
            dirs    = point_direction( x, y, temp_x, temp_y );
            
            // Define max X/Y threshold
            max_x   = lengthdir_x( thumb_r * 2, dirs );
            max_y   = lengthdir_y( thumb_r * 2, dirs );
            
            // Clamps thumbstick position X
            if ( max_x < 0 ) {
                thumb_x = clamp( temp_x, x + max_x, x );
            } else {
                thumb_x = clamp( temp_x, x, x + max_x );
            }
            
            // Clamps thumbstick position Y
            if ( max_y < 0 ) {
                thumb_y = clamp( temp_y, y + max_y, y );
            } else {
                thumb_y = clamp( temp_y, y, y + max_y );
            }
        
            // Define button states for press hold and release
            hold    = device_mouse_check_button( i, mb_left );
            press   = device_mouse_check_button_pressed( i, mb_left );
            release = device_mouse_check_button_released( i, mb_left );
            
            // Break this for loop
            break;
        } else {
            // Reset index and all states
            _idx    = -1;
            hold    = false;
            press   = false;
            release = false;
        }
    }
} else {
    // Define button states
    hold    = mouse_check_button( mb_left );
    press   = mouse_check_button_pressed( mb_left );
    release = mouse_check_button_released( mb_left );
    
    // Get direction and distance from X/Y
    var dirs    = point_direction( x, y, mouse_x, mouse_y ), 
        max_x   = lengthdir_x( thumb_r * 2, dirs ), 
        max_y   = lengthdir_y( thumb_r * 2, dirs );
    
    // Checks if mouse pointer is pressed/held inside boundaries
    if (
        mouse_x >= x - bound_r 
        && mouse_x <= x + bound_r 
        && mouse_y >= y - bound_r 
        && mouse_y <= y + bound_r 
        && ( hold || press ) 
    ) {
    // Clamps thumbstick position X
        if ( max_x < 0 ) {
            thumb_x = clamp( mouse_x, x + max_x, x );
        } else {
            thumb_x = clamp( mouse_x, x, x + max_x );
        }
        
        // Clamps thumbstick position Y
        if ( max_y < 0 ) {
            thumb_y = clamp( mouse_y, y + max_y, y );
        } else {
            thumb_y = clamp( mouse_y, y, y + max_y );
        }
    } else {
        // If not being held inside, set both press/hold as false
        hold    = false;
        press   = false;
    }
}
    
// Get length of distance to calculate deadzone values
dist    = point_distance( x, y, thumb_x, thumb_y ) - dead_min;
if ( dist < 0 ) dist    = 0;

// If distance is above the deadzone threshold
if ( dist > 0 ) {
    // Define temporary X/Y for thumbsticks
    var x_pos, y_pos;
    
    // Check thumb X
    if ( thumb_x > x ) {
        x_pos   = thumb_x - x - dead_min;
    } else if ( thumb_x < x ) {
        x_pos   = 0 - ( x - thumb_x - dead_min );
    } else {
        x_pos   = 0;
    }
    
    // Check H pos
    h_pos   = x_pos / ( thumb_max * deadzone_r );
    
    // Check thumb Y
    if ( thumb_y > y ) {
        y_pos   = thumb_y - y - dead_min;
    } else if ( thumb_y < y ) {
        y_pos   = 0 - ( y - thumb_y - dead_min );
    } else {
        y_pos   = 0;
    }
    
    // Check V pos
    v_pos   = y_pos / ( thumb_max * deadzone_r );
}

// Checks hold and press states and, if both are false, return to center
if ( thumb_x != x && hold == false && press == false ) {
    thumb_x = approach( thumb_x, x, thumb_r / 2 );
}

if ( thumb_y != y && hold == false && press == false ) {
    thumb_y = approach( thumb_y, y, thumb_r / 2 );
}
