//
//  MoonUtils.swift
//  suncalc-example
//
//  Created by Shaun Meredith on 10/2/14.
//

import Foundation

struct MoonUtils {
	
    // moon calculations, based on http://aa.quae.nl/en/reken/hemelpositie.html formulas
    
    /// Returns the geocentric ecliptic coordinates of the Moon
    ///
    /// - parameter d: The target Julian Date
    /// - returns: The geocentric ecliptic coordinates of the Moon
	static func getMoonCoords(d:Double) -> GeocentricCoordinates {
		// geocentric ecliptic coordinates of the moon
		
		let L:Double = Constants.RAD * (218.316 + 13.176396 * d);   // ecliptic longitude
		let M:Double = Constants.RAD * (134.963 + 13.064993 * d);   // mean anomaly
		let F:Double = Constants.RAD * (93.272 + 13.229350 * d);    // mean distance
		
		let l:Double  = L + Constants.RAD * 6.289 * sin(M);    // longitude
		let b:Double  = Constants.RAD * 5.128 * sin(F);        // latitude
		let dt:Double = 385001 - 20905 * cos(M);     // distance to the moon in km
		
        return GeocentricCoordinates(rightAscension: PositionUtils.getRightAscension(lambda:l, beta: b), declination: PositionUtils.getDeclination(lambda: l, beta: b), distance: dt)
	}
}
