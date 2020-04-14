
import UIKit

public struct HTMLParser {
    public init() { }

    func htmlTemplate(for string: String) -> String {
    """
    <!DOCTYPE html>
    <html lang="nl">
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="initial-scale=1">
            <style>
                html, body, div, span, applet, object, iframe,
                h1, h2, h3, h4, h5, h6, p, blockquote, pre,
                a, abbr, acronym, address, big, cite, code,
                del, dfn, em, img, ins, kbd, q, s, samp,
                small, strike, strong, sub, sup, tt, var,
                b, u, i, center,
                dl, dt, dd, ol, ul, li,
                fieldset, form, label, legend,
                table, caption, tbody, tfoot, thead, tr, th, td,
                article, aside, canvas, details, embed,
                figure, figcaption, footer, header, hgroup,
                menu, nav, output, ruby, section, summary,
                time, mark, audio, video {
                    margin: 0;
                    padding: 0;
                    border: 0;
                    font-size: 100%;
                    font: inherit;
                    vertical-align: baseline;
                }

                body {
                    font-family: "HelveticaNeue";
                    font-size: 14px;
                    font-weight: 400;
                    color: #4D4D4D;
                    line-height: 18px;
                }

                em {
                    font-style: italic;
                }

                strong {
                    font-weight: bold;
                }

                li {
                    line-height: 16px;
                }

                br {
                     font-size: 8px;
                     line-height: 2px;
                }
            </style>
        </head>
        <body>
            \(string)
        </body>
    </html>
    """
    }

    public func attributedString(from bodyString: String) -> NSAttributedString {
        let encodedData = htmlTemplate(for: bodyString).data(using: String.Encoding.utf8)!
        let attributedOptions: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: NSNumber(value: String.Encoding.utf8.rawValue)
        ]

        return try! NSMutableAttributedString(data: encodedData, options: attributedOptions, documentAttributes: nil)
    }

}
