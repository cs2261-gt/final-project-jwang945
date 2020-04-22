
//{{BLOCK(instructionsscreen)

//======================================================================
//
//	instructionsscreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 272 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 8704 + 2048 = 11264
//
//	Time-stamp: 2020-04-21, 21:30:03
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTIONSSCREEN_H
#define GRIT_INSTRUCTIONSSCREEN_H

#define instructionsscreenTilesLen 8704
extern const unsigned short instructionsscreenTiles[4352];

#define instructionsscreenMapLen 2048
extern const unsigned short instructionsscreenMap[1024];

#define instructionsscreenPalLen 512
extern const unsigned short instructionsscreenPal[256];

#endif // GRIT_INSTRUCTIONSSCREEN_H

//}}BLOCK(instructionsscreen)
