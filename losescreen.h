
//{{BLOCK(losescreen)

//======================================================================
//
//	losescreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 7 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 224 + 2048 = 2784
//
//	Time-stamp: 2020-04-06, 19:57:42
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LOSESCREEN_H
#define GRIT_LOSESCREEN_H

#define losescreenTilesLen 224
extern const unsigned short losescreenTiles[112];

#define losescreenMapLen 2048
extern const unsigned short losescreenMap[1024];

#define losescreenPalLen 512
extern const unsigned short losescreenPal[256];

#endif // GRIT_LOSESCREEN_H

//}}BLOCK(losescreen)
