
//{{BLOCK(retrobackground)

//======================================================================
//
//	retrobackground, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 508 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 16256 + 2048 = 18816
//
//	Time-stamp: 2020-04-14, 23:26:22
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_RETROBACKGROUND_H
#define GRIT_RETROBACKGROUND_H

#define retrobackgroundTilesLen 16256
extern const unsigned short retrobackgroundTiles[8128];

#define retrobackgroundMapLen 2048
extern const unsigned short retrobackgroundMap[1024];

#define retrobackgroundPalLen 512
extern const unsigned short retrobackgroundPal[256];

#endif // GRIT_RETROBACKGROUND_H

//}}BLOCK(retrobackground)
