//
//  Beers.swift
//  StoreAppConceptAnimation
//
//  Created by Allen Whearry on 1/30/19.
//  Copyright © 2019 Codeine Technologies LLC. All rights reserved.
//

import Foundation

enum BeerType: String {
    case yearRound = "Year Rounds"
    case seasonal = "Seasonals"
}

enum AvailableIn: String {
    case bottle = "Bottle"
    case draft = "Draft"
    case sixteenCan = "16oz Can"
    case twelveCan = "12oz Can"
}

struct Beer {
    var title: String
    var subTitle: String
    var description: String
    var abv: Double
    var ibus: Double
    var maltBill: String
    var hopsCity: String
    var dryHop: String
    var flavorProfile: String
    var availableIn: [AvailableIn]
    var beerType: BeerType
    var photo: [Photo]
    
}
struct Photo {
    var title: String
}

var beers: [Beer] = [
    Beer(title: "420 Strain G13 IPA",
         subTitle: "",
         description: "This aromatic super-hybrid sticky IPA is first and foremost a phenomenally delicious and drinkable beer, with the added bonus of an olfactory experience that mimics that of the legendary G13 cannabis strain. The IPA base brew has a great body, good head and nice amount of haze at a pleasurable 6% ABV. To work with the malt bill, the brewers added some of their dankest hops, Columbus and Simcoe, plus two dry hop additions. To achieve the aroma, our brewers found the perfect botanically-sourced, strain specific terpenes and married them with propriety natural hemp flavor, both perfectly complementing the hops in the IPA.",
         abv: 6, ibus: 48,
         maltBill: "2 Row Malt, Wheat, Flaked Oats",
         hopsCity: "Columbus, Simcoe",
         dryHop: "A double dose of Simcoe and Columbus",
         flavorProfile: "Dank, citrus, earthy, resiny",
         availableIn: [.draft],
         beerType: .yearRound,
         photo: [
            Photo(title: "Individual-Brew-Images-420strain"),
            Photo(title: "sw-brew-420stain-product-vignette-1"),
        ]),
    
    Beer(title: "TripleTail",
         subTitle: "Chase one down!",
         description: "A tropical approach to the IPA style – TripleTail weaves juicy bodacious hops with notes of papaya, pineapple, and passionfruit into this lush hop-forward IPA, creating a mouthwatering vacation for your senses. At 5.5% ABV, you can lean back assured it will refresh from sun up to sun down.",
         abv: 5.5, ibus: 57,
         maltBill: "2Row, Pilsner, Carapils",
         hopsCity: "Bravo, Mosaic, Denali",
         dryHop: "Mosaic, Denali, Citra, Waimea",
         flavorProfile: "Papaya, pineapple, passionfruit",
         availableIn: [.bottle, .twelveCan],
         beerType: .yearRound,
         photo: [
            Photo(title: "tripletail-vignette"),
        ]),
    
    Beer(title: "420 Extra Pale Ale",
         subTitle: "Dry Hopped with a fat stash of Cascade hops.",
         description: "Our most popular brew! A tasty West Coast style Extra Pale Ale accentuated with a stimulating hop character. First conceived in our bat cave on 4/20, this kind of beer keeps the wheels on the bus going round and round!",
         abv: 5.7, ibus: 39,
         maltBill: "2 Row, Munich, Wheat, Midnight Wheat",
         hopsCity: "Centennial, Cascade",
         dryHop: "Cascade",
         flavorProfile: "Herbal, floral, fresh",
         availableIn: [.bottle, .twelveCan, .sixteenCan, .draft],
         beerType: .yearRound,
         photo: [
            Photo(title: "brew-bottle-420"),
            Photo(title: "brew-420-product"),
            ]),
    
    Beer(title: "IPA",
         subTitle: "\"A hophead's beery dream\" - Beer Advocate",
         description: "This mammoth IPA is defined by generous quantities of juicy American hops. The extensive dry hopping process contributes to its bright and flavorful character. This beer is unfiltered to leave all the natural flavors intact and bottle conditioned to stay super fresh.",
         abv: 6.3, ibus: 50,
         maltBill: "Munich, Wheat, 2-Row, 70/80",
         hopsCity: "Columbus, Chinook, Cascade, Simcoe, Golding",
         dryHop: "Simcoe, US Golding",
         flavorProfile: "Citrusy, piney, hint of grapefruit",
         availableIn: [.bottle, .twelveCan, .sixteenCan],
         beerType: .yearRound,
         photo: [
            Photo(title: "brew-bottle-ipa"),
            Photo(title: "product-image-brew_ipa"),
            ]),
    
    Beer(title: "Exodus",
         subTitle: "",
         description: "Stay warm on a cold day with this Jamaican Blue Mountain blend coffee porter. Blended with coffee from Javavino, Exodus delivers distinct irie hop notes up front which transcend into rich waves of roasty chocolate malts creating a smooth multidimensional taste experience.",
         abv: 6.6, ibus: 0,
         maltBill: "2 Row, Munich, Chocolate, Caramel",
         hopsCity: "Centennial, Golding, Willamette",
         dryHop: "N/A",
         flavorProfile: "Coffee, Chocolate, Malt",
         availableIn: [.bottle, .twelveCan, .draft],
         beerType: .seasonal,
         photo: [
            Photo(title: "exodus-product-vignette"),
            ]),
    
    Beer(title: "Mosaic",
         subTitle: "Single Hop Hazy IPA",
         description: "Watch those fall colors come out with this double dry hopped hazy IPA. Mosaic is packed with delicious hops giving it a citrus herbal fruity build with a crisp clean finish. This seasonal release IPA is a graduate from our Hatchery pilot brewhouse!",
         abv: 6.2, ibus: 52,
         maltBill: "2 Row, Malted Oats , Wheat",
         hopsCity: "Mosaic",
         dryHop: "Simcoe, US Golding",
         flavorProfile: "Herbal, Citrus",
         availableIn: [.bottle, .twelveCan, .draft],
         beerType: .seasonal,
         photo: [
            Photo(title: "mosaic-product-vignette"),
            ])
]
