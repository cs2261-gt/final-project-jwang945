
//{{BLOCK(startscreen)

//======================================================================
//
//	startscreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 35 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1120 + 2048 = 3680
//
//	Time-stamp: 2020-04-08, 16:46:54
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_STARTSCREEN_H
#define GRIT_STARTSCREEN_H

#define startscreenTilesLen 1120
extern const unsigned short startscreenTiles[560];

#define startscreenMapLen 2048
extern const unsigned short startscreenMap[1024];

#define startscreenPalLen 512
extern const unsigned short startscreenPal[256];

#endif // GRIT_STARTSCREEN_H

//}}BLOCK(startscreen)
