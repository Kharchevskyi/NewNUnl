//
//  File.swift
//  
//
//  Created by Anton Kharchevskyi on 14/04/2020.
//

import Foundation

// MARK: - ARTICLE
public struct ArticleTitle: Equatable {
    public let title = "Fransman gebruikt per ongeluk schietstoel tijdens ritje in straaljager"
    public let subtitle = "Een 64-jarige man uit Frankrijk werd vorig jaar per schietstoel uit een straaljager gekatapulteerd. Hij greep per ongeluk de uitwerphendel, maakten onderzoekers van de Franse luchtvaartautoriteit dinsdag bekend."
    public let imageURLstring = "https://picsum.photos/300/200.jpg"
    public let date = Date(timeInterval: -100, since: Date())
}

public struct ArticleBody: Equatable {
    static var block1: ArticleBody = ArticleBody(bodyHtml: """
    <p>De man, die een bedrijf uit de defensie-industrie leidt, werd door collega's verrast met een ritje achteriin een Dassault Rafale B tweezitter. De onderzoekers stellen dat hij daar helemaal geen zin in had en zijn hart tekeerging, maar dat hij de gift niet durfde te weigeren.</p>
    """
    )


    static var block2: ArticleBody = ArticleBody(bodyHtml: """
    <p>Bij het opstijgen bleken de gordels van de man niet strak genoeg vast te zitten, waardoor hij boven zijn stoel ging zweven. Om zijn balans te hervinden greep hij zich vast aan wat de hendel van zijn schietstoel bleek te zijn. De man werd op 400 meter hoogte en bij een snelheid van meer dan 500 kilometer per uur uit de straaljager geschoten.</p>
    """
    )

    static var block3: ArticleBody = ArticleBody(bodyHtml: """
    <p>De parachute van de Fransman zorgde voor een relatief veilige landing in een nabijgelegen veld. Hij werd met lichte verwondingen naar een ziekenhuis gebracht. De piloot wist te voorkomen dat ook hij uit het toestel werd geworpen en kon de Rafale weer aan de grond zetten.</p>
    """
    )

    static var block4: ArticleBody = ArticleBody(bodyHtml: """
    <p>Volgens de onderzoekers werden er meerdere fouten gemaakt in aanloop naar het incident. Medische waarschuwingen dat de passagier niet mocht worden blootgesteld aan de hoge g-krachten bij het opstijgen van een straaljager werden genegeerd en zijn stoelriemen zaten te los. Ook verloor hij bij het uitwerpen zijn helm.</p>
    """
    )

    public let bodyHtml: String
}
