/// @description Draws the button's shape

// Set face alpha
draw_set_alpha( 0.5 );

// Drawing button face
draw_set_colour( color );

// Drawing the button
draw_circle( x, y, button_r, false );

// Set outline color
draw_set_colour( c_black );

// If held/pressed, draw a darker shape behind
if ( hold || press ) {
    // Set button alpha
    draw_set_alpha( 0.25 );
    
    // Dark color
    draw_set_colour( c_dkgray );
    
    // Drawing!
    draw_circle( x, y, button_r, false );
}

// Checks if text is != ""
if ( text != "" ) {
    // Set text alpha
    draw_set_alpha( 0.5 );

    // Set text color
    draw_set_colour( c_black );
    
    // Set text align
    draw_set_halign( fa_center );
    draw_set_valign( fa_middle );
    
    // Draw text
    draw_text( x, y, text );
    
    // Reset text align
    draw_set_halign( fa_left );
    draw_set_valign( fa_top );
}

// Draw outline
draw_circle( x, y, button_r, true );
