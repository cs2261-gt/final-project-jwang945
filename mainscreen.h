
//{{BLOCK(mainscreen)

//======================================================================
//
//	mainscreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 233 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 7456 + 2048 = 10016
//
//	Time-stamp: 2020-04-28, 20:14:14
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MAINSCREEN_H
#define GRIT_MAINSCREEN_H

#define mainscreenTilesLen 7456
extern const unsigned short mainscreenTiles[3728];

#define mainscreenMapLen 2048
extern const unsigned short mainscreenMap[1024];

#define mainscreenPalLen 512
extern const unsigned short mainscreenPal[256];

#endif // GRIT_MAINSCREEN_H

//}}BLOCK(mainscreen)
