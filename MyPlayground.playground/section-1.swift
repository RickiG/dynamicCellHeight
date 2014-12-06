// Playground - noun: a place where people can play

import UIKit

let text = "Roof party McSweeney's four dollar toast, artisan mustache cardigan keytar post-ironic small batch you probably haven't heard of them Kickstarter. Aesthetic Godard hella chia typewriter gastropub, dreamcatcher taxidermy shabby chic food truck street art. Fixie VHS skateboard lomo art party, meggings viral food truck shabby chic Thundercats literally. Schlitz cardigan beard, chambray 8-bit quinoa butcher hoodie Intelligentsia stumptown chillwave shabby chic whatever. Neutra High Life actually fap, listicle raw denim aesthetic Austin Brooklyn crucifix tattooed yr cardigan forage seitan"

var words = text.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
let count = words.count
let titleLength = 8
let titleStartIndex = 15
let titleEndIndex = titleStartIndex + titleLength
let titleSlice: Array<String> = Array(words[titleStartIndex...titleEndIndex])