$fn = 100;


module corner( height )
{
    union()
    {
        sphere( d = 1.2 );
        cylinder( d = 1.2, h = height );
    }
}

module lampHole()
{
    translate( [ 0, 1.5, 0 ] )
    {
        hull()
        {
            rotate( [ 90, 0, 0 ] ) cylinder( d = 3, h = 3 );
            translate( [ 5, 0, 8 ] ) rotate( [ 90, 0, 0 ] ) cylinder( d = 3, h = 3 );
        }
    }
}

module bottomShell()
{
    union()
    {
        difference()
        {

            hull()
            {
                corner( 25 );
                translate( [ 83, 0, 0 ] ) corner( 25 );
                translate( [ 0, 52, 0 ] ) corner( 25 );
                translate( [ 83, 52, 0 ] ) corner( 25 );
            }
        
            translate( [ 1, 1, 1] ) cube( [ 83 - 2, 52 - 2, 25  ] );
        
            
            
            //temp / humidity holes
            for( i = [ 0 : 8 : 20 ] )
            {
                translate( [ 56 + i, 52, 7 ] ) lampHole();
            }

            for( i = [ 0 : 8 : 20 ] )
            {
                translate( [ 83 , 27 + i, 7 ] ) rotate( [0, 0, 90 ] ) lampHole();
            }
        
            
            //latch holes
            //sides
            translate( [ 5, -1.5, 21 ] ) cube( [ 10, 3, 2 ] );
            translate( [ 5, -1.5 + 52, 21 ] ) cube( [ 10, 3, 2 ] );
            
            translate( [ 83 - 1 - 10 - 5, -1.5, 21 ] ) cube( [ 10, 3, 2 ] );
            
            translate( [ 83 - 1 - 10 - 5, -1.5 + 52, 21 ] ) cube( [ 10, 3, 2 ] );
            
            
            //front/back
            translate( [ -1.5, ( 52 / 2 ) - ( 10 / 2 ), 21 ] ) cube( [ 3, 10, 2 ] );
            translate( [ 83 - 1.5, ( 52 / 2 ) - ( 10 / 2 ), 21 ] ) cube( [ 3, 10, 2 ] );
            
            
            //usb
            translate([-11,24+0.4,1]) cube([25,11.5,6.5]);
        }
        
            
        
        //battery
        //translate([2,0,0]) #cube([77.5+1,20.7+1,23]);

        //esp32
        //translate([0,24,0]) #cube([49.7+1,25.7+1,23]);        
        
        
        translate( [ 0, 22.1, 0 ] ) cube( [ 82, 1.6, 18 ] );

        translate( [ 51, 22.1, 0 ] ) cube( [ 2, 30, 18 ] );
    }
}

module latch()
{
    translate( [ 0.4, 0, 0.0 ] ) cube( [ 10 - 0.8, 2, 4 ]);
    
    
    
    translate( [ 0.4, -1.6, 0 ] ) 
    difference()
    {
        cube( [ 10 - 0.8, 1.6, 2 - 0.4 ] );
        translate( [ 5, 1 -0.8, 1 - 1.25 ] ) rotate( [ 55, 0, 0 ] ) cube( [ 10, 2, 2 ], center = true );
        
    }
}
module latch2()
{
    translate( [ 0.4, 0, 0.0 ] ) cube( [ 10 - 0.8, 2, 4 ]);
    
    translate( [ 0.4, -1.2, 0 ] ) 
    difference()
    {
        cube( [ 10 - 0.8, 1.2, 2 - 0.4 ] );
        translate( [ 5, 1 -0.8, 1 - 1.25 ] ) rotate( [ 55, 0, 0 ] ) cube( [ 10, 2, 2 ], center = true );
        
    }
    
    
}

module lid()
{
    
    union()
    {
    
        hull()
        {
            cylinder( d = 1.2, h = 1 );
            translate( [ 83, 0, 0 ] ) cylinder( d = 1.2, h = 1 );
            translate( [ 0, 52, 0 ] ) cylinder( d = 1.2, h = 1 );
            translate( [ 83, 52, 0 ] ) cylinder( d = 1.2, h = 1 );
        }
    
        
        translate( [ 5, 1.2, -4 ] ) latch();
        translate( [ 83 - 1 - 10 - 5, 1.2, -4 ] ) latch();
        
        translate( [ 5, -1.2 + 52, -4 ] ) mirror( [ 0, 1, 0 ]) latch();
        
        translate( [ 83 - 1 - 10 - 5, -1.2 + 52, -4 ] ) mirror( [ 0, 1, 0 ]) latch();
        
        translate( [ 1.2, ( 52 / 2 ) - ( 10 / 2 ) + 10, -4 ] ) rotate( [ 0, 0, 270 ] ) latch2();
        
        translate( [ 83 - 1.2, ( 52 / 2 ) - ( 10 / 2 ), -4 ] ) rotate( [ 0, 0, 90 ] ) latch2();
    }
}


color( "white" ) bottomShell();
color( "gray" ) translate( [ 0, 0, 25 ] ) lid();




