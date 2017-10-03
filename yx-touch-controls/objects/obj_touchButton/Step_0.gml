/// @description Updates button state

// Checks if mobile or not
if ( os_type == os_android || os_type == os_ios ) {
    // Temporary "loop cutting" parameter
    var cuts;
    
    // First, check all the touch inputs (5 total)
    for ( var i = 0; i <= 4; i++ ) {
        // Temporary position
        var temp_x  = device_mouse_x( i ), 
            temp_y  = device_mouse_y( i );
        
        // Initial break value
        cuts    = false;
        
        // Comparing ID and index of analog sticks
        with ( obj_touchAnalog ) {
            // If ID is different and index is == i
            if ( _idx == i ) {
                // Sets to break this check and continue loop
                cuts = true;
                // Breaks this loop
                break;
            }
        }
        
        // Comparing ID and index of other buttons
        with ( obj_touchButton ) {
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
    // Checks if mouse pointer is pressed/held inside boundaries
    if (
        mouse_x >= x - bound_r 
        && mouse_x <= x + bound_r 
        && mouse_y >= y - bound_r 
        && mouse_y <= y + bound_r 
    ) {
        // Define button states
        hold    = mouse_check_button( mb_left );
        press   = mouse_check_button_pressed( mb_left );
        release = mouse_check_button_released( mb_left );
    } else {
        // If hold or press are still in TRUE state
        if ( hold || press ) {
            hold        = false;
            press       = false;
            release     = true;
            // Set alarm to 1 tick, to simulate a release
            alarm[0]    = 1;
        }
    }
}
