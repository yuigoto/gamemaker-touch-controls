/// @description Draws the thumb stick on screen

// Set alpha to 0.25 to draw the outline
draw_set_alpha( .5 );

// Set outline color
draw_set_colour( c_black );

// Draw the outline circle
draw_circle( x, y, dead_min, true );

// Draw the outline circle
draw_circle( x, y, thumb_r * 3, true );

// Draw the inner circle
draw_circle( x, y, thumb_r * 2, true );

// Set alpha to 0.25 to draw the back of the stick
draw_set_alpha( .25 );

// Set color to dark gray
draw_set_colour( c_dkgray );

// Draw the limits
draw_circle( x, y, thumb_r * 3, false );

// Draw the inner limits
draw_circle( x, y, thumb_r * 2, false );

// Set alpha to 0.5 to draw the thumbstick
draw_set_alpha( .5 );

// Set outline color
draw_set_colour( c_black );

// Draw the thumb position
draw_circle( thumb_x, thumb_y, thumb_r, true );

// Set fill color
draw_set_colour( c_white );

// Draw the thumb position
draw_circle( thumb_x, thumb_y, thumb_r, false );

draw_line_width( x, y, thumb_x, thumb_y, 8 );

// Reset alpha
draw_set_alpha( 1 );