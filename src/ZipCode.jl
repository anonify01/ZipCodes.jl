module ZipCode

using   DataFrames

export  ZIPCODES,                     # Constant DataFrame

        cleanzipcode,                 # Applies multiple cleaning functions
             removewhitespace,        # Trailing and leading whitespace
             removezipsuffix,         # ZIP+4 suffix
             padleftzeros,            # Pads leading zeros

        coord_distance,               # Calculate distance between lat/lon
        haversine,                    # Haversine distance calculation
        vincenty,                     # Vincenty distance calculation
        flatpythagorean,              # Flat Earth distance calculation
        EARTH_RADIUS_EQUATORIAL,      # Equatorial radius (meters)
        EARTH_RADIUS_POLAR,           # Polar radius (meters)

        rowcoord                      # (lat, long) for dataframe row

const ZIPCODES = readtable(joinpath(dirname(@__FILE__), "data", "zipcode.csv"), eltypes=[String,String,String,Float64,Float64,Int64,Int64])

include("./cleanzips.jl")
include("./distance.jl")
include("./utils.jl")

end
