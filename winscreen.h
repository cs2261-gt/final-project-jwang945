
//{{BLOCK(winscreen)

//======================================================================
//
//	winscreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 20 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 640 + 2048 = 3200
//
//	Time-stamp: 2020-04-06, 19:59:00
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WINSCREEN_H
#define GRIT_WINSCREEN_H

#define winscreenTilesLen 640
extern const unsigned short winscreenTiles[320];

#define winscreenMapLen 2048
extern const unsigned short winscreenMap[1024];

#define winscreenPalLen 512
extern const unsigned short winscreenPal[256];

#endif // GRIT_WINSCREEN_H

//}}BLOCK(winscreen)
