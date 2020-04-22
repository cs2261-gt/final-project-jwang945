
//{{BLOCK(mainscreen)

//======================================================================
//
//	mainscreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 17 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 544 + 2048 = 3104
//
//	Time-stamp: 2020-04-21, 22:50:07
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MAINSCREEN_H
#define GRIT_MAINSCREEN_H

#define mainscreenTilesLen 544
extern const unsigned short mainscreenTiles[272];

#define mainscreenMapLen 2048
extern const unsigned short mainscreenMap[1024];

#define mainscreenPalLen 512
extern const unsigned short mainscreenPal[256];

#endif // GRIT_MAINSCREEN_H

//}}BLOCK(mainscreen)
