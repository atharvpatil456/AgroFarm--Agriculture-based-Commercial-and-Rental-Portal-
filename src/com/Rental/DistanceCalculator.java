package com.Rental;
import java.lang.Math;
public class DistanceCalculator {
	
	public static final double RADIUS_OF_EARTH = 6371; // Earth's radius in kilometers

    public static double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
        // Convert latitude and longitude values from degrees to radians
        double lat1Rad = Math.toRadians(lat1);
        double lon1Rad = Math.toRadians(lon1);
        double lat2Rad = Math.toRadians(lat2);
        double lon2Rad = Math.toRadians(lon2);

        // Calculate the differences between the latitude and longitude values
        double latDiff = lat2Rad - lat1Rad;
        double lonDiff = lon2Rad - lon1Rad;

        // Apply the Haversine formula
        double a = Math.sin(latDiff / 2) * Math.sin(latDiff / 2) +Math.cos(lat1Rad) * Math.cos(lat2Rad) * Math.sin(lonDiff / 2) * Math.sin(lonDiff / 2);

                   
                  
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));

        // Calculate the distance
        double distance = RADIUS_OF_EARTH * c;

        return distance;
    }

}
