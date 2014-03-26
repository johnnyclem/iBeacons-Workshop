//
//  Painting.m
//  AirLocate
//
//  Created by John Clem on 3/25/14.
//  Copyright (c) 2014 Apple. All rights reserved.
//

#import "Painting.h"

@implementation Painting

+ (Painting *)monaLisa
{
    Painting *monaLisa = [Painting new];
    monaLisa.text = @"The most famous painting of all time, the Mona Lisa was painted by Leonardo da Vinci during the Renaissance in Florence. He began painting the Mona Lisa in 1503 or 1504 and finished it shortly before he died in 1519. The painting is named for Lisa del Giocondo, a member of a wealthy family of Florence. In 1911, the Mona Lisa was stolen by Louvre employee Vincenzo Peruggia, an Italian patriot who believed the Mona Lisa should be returned to Italy. After having kept the painting in his apartment for two years, Peruggia was finally caught when he attempted to sell it to the directors of the Uffizi Gallery in Florence. Today, the Mona Lisa hangs again in the Louvre in Paris where 6 million people see the painting each year. - See more at: http://www.touropia.com/most-famous-paintings/#sthash.YyhA0gcK.dpuf";
    monaLisa.image = [UIImage imageNamed:@"monaLisa"];
    
    return monaLisa;
}

+ (Painting *)starryNight
{
    Painting *starryNight = [Painting new];
    starryNight.text = @"The Starry Night was painted by Dutch artist Vincent van Gogh. Although Van Gogh sold only one painting in his life, the aftermath of his work is enormous. Starry Night is one of his most famous paintings and has become one of the most well known images in modern culture. The painting shows the village of Saint-Rémy under a swirling sky, in a view from the asylum towards north. The cypress tree to the left was added into the composition. Since 1941 it has been in the permanent collection of the Museum of Modern Art in New York. A Starry Night high resolution image can be found here. - See more at: http://www.touropia.com/most-famous-paintings/#sthash.YyhA0gcK.dpuf";
    starryNight.image = [UIImage imageNamed:@"starryNight"];
    
    return starryNight;
}

+ (Painting *)lastSupper
{
    Painting *lastSupper = [Painting new];
    lastSupper.text = @"The Last Supper is a 15th century mural painting in Milan created by Leonardo da Vinci and covers the back wall of the dining hall at the monastery of Santa Maria delle Grazie in Milan. It represents the scene of The Last Supper when Jesus announces that one of his Twelve Apostles would betray him. Leonardo began work on The Last Supper in 1495 and completed it in 1498 though he did not work on the painting continuously. Some writers propose that the person in the painting seated to the left of Jesus is Mary Magdalene rather than John the Apostle, as most art historians identify that person. This popular theory was the topic of the book The Templar Revelation (1997), and plays a central role in Dan Brown’s novel The Da Vinci Code (2003). - See more at: http://www.touropia.com/most-famous-paintings/#sthash.YyhA0gcK.dpuf";
    lastSupper.image = [UIImage imageNamed:@"lastSupper"];
    
    return lastSupper;
}

@end
