program Chapter4_SDL2;

uses SDL2, SDL2_image;

var
sdlWindow1 : PSDL_Window;
sdlRenderer : PSDL_Renderer;
sdlTexture1 : PSDL_Texture;

begin

  //initilization of video subsystem
  if SDL_Init( SDL_INIT_VIDEO ) < 0 then HALT;

  //Ouvre une fenêtre Windows
  sdlWindow1 := SDL_CreateWindow( 'Ghost Recon Wildlands', 50, 50, 500, 500, SDL_WINDOW_SHOWN ); 
  if sdlWindow1 = nil then HALT; 

  //Je pense que ça joue sur le rendu de la fenêtre WINDOWS
  sdlRenderer := SDL_CreateRenderer( sdlWindow1, -1, 0 );
  if sdlRenderer = nil then HALT;

  //Charge l'image
  sdlTexture1 := IMG_LoadTexture( sdlRenderer, 'C:\FPC\3.0.0\units\SDL2\GRW.jpg' ); //Image dans le mail
  if sdlTexture1 = nil then HALT;
  SDL_RenderCopy( sdlRenderer, sdlTexture1, nil, nil );
  SDL_RenderPresent (sdlRenderer);
  SDL_Delay( 3000 );

  //"Détruit" l'image et la fenêtre 
  SDL_DestroyTexture( sdlTexture1 );
  SDL_DestroyRenderer( sdlRenderer );
  SDL_DestroyWindow ( sdlWindow1 );

  //shutting down video subsystem
  SDL_Quit;

end.