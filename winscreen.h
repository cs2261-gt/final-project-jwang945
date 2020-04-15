
//{{BLOCK(winscreen)

//======================================================================
//
//	winscreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 33 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1056 + 2048 = 3616
//
//	Time-stamp: 2020-04-14, 23:41:34
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WINSCREEN_H
#define GRIT_WINSCREEN_H

#define winscreenTilesLen 1056
extern const unsigned short winscreenTiles[528];

#define winscreenMapLen 2048
extern const unsigned short winscreenMap[1024];

#define winscreenPalLen 512
extern const unsigned short winscreenPal[256];

#endif // GRIT_WINSCREEN_H

//}}BLOCK(winscreen)
