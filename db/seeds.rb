# This file should contain all the record creation needed to seed the database with its default values.

# Let's create an array of Games objects
games = [
  { 
    title: 'Animal Crossing: New Horizons', 
    genre: 'Social simulation',
    image: 'https://external-preview.redd.it/XmYU1C6KD9q1m9qY1hnedMhwYbwdWf3J2F-BcDpiav0.png?width=640&crop=smart&format=pjpg&auto=webp&s=2360ca1c22804ef5bb63b6405bed169d4c04c620', 
    description: 'Taking place in real time, the player can explore the island in a nonlinear fashion, gathering and crafting items, catching insects and fish, and developing the island into a community of anthropomorphic animals.',
  },
  { 
    title: 'Cyberpunk 2077', 
    genre: 'Open world',
    image: 'https://shelvid.com/assets/images/games/1877.jpg', 
    description: 'Cyberpunk 2077 is an open-world, action-adventure story set in Night City, a megalopolis obsessed with power, glamour and body modification. You can customize your character\'s cyberware, skillset and playstyle, and explore a vast city where the choices you make shape the story and the world around you.',
  },
  {
    title: 'The Last of Us Part II',
    genre: 'Action-adventure',
    image: 'https://i.pinimg.com/736x/79/81/bb/7981bb13bff6c7082e61803f07f1e6b7.jpg',
    description: 'The Last of Us Part II is played from the third-person perspective and allows the player to fight human enemies and cannibalistic zombie-like creatures with firearms, improvised weapons, and stealth.',
  },
  {
    title: '',
    genre: '',
    image: 'https://cheapdigitalkeys.com/wp-content/uploads/2020/05/doom-eternal-cover.jpg',
    description: 'Doom Eternal is a first-person shooter game set some time after the events of the 2016 game, the story follows the Doomguy once again, on a mission to end Hell\'s consumption of Earth and foil the alien Maykr\'s plans to exterminate humanity.',
  },
  {
    title: 'Final Fantasy VII Remake',
    genre: 'Action role-playing',
    image: 'https://www.thathashtagshow.com/wp-content/uploads/2021/01/630722-final-fantasy-vii-remake-playstation-4-front-cover.png',
    description: 'Final Fantasy VII Remake is an action role-playing game developed and published by Square Enix. It is the first in a planned series of games remaking the 1997 PlayStation game Final Fantasy VII. Set in the dystopian cyberpunk metropolis of Midgar, players control mercenary Cloud Strife.',
  },
  {
    title: 'Ghost of Tsushima',
    genre: 'Action-adventure, ‎stealth',
    image: 'https://i.redd.it/h06xohhktsm41.jpg',
    description: 'Ghost of Tsushima is a 2020 action-adventure game developed by Sucker Punch Productions and published by Sony Interactive Entertainment. Featuring an open world, the player controls Jin Sakai, a samurai on a quest to protect Tsushima Island during the first Mongol invasion of Japan.',
  },
  {
    title: 'Half-Life: Alyx',
    genre: 'VR game',
    image: 'https://external-preview.redd.it/4LaQaK-qrjNPmW0Og_sOpETKWMIZQQftm_ddQlSSw2s.png?format=pjpg&auto=webp&s=f4784327f214c1b6f0bfc05abadf675812f620e5',
    description: 'Half-Life: Alyx is a 2020 virtual reality first-person shooter developed and published by Valve. Set between the events of Half-Life and Half-Life 2, players control Alyx Vance on a mission to seize a superweapon belonging to the alien Combine.',
  },
  {
    title: 'Ori and the Will of the Wisps',
    genre: 'Platform-adventure',
    image: 'https://www.mobygames.com/images/covers/l/684527-ori-and-the-will-of-the-wisps-nintendo-switch-front-cover.jpg',
    description: 'Ori and the Will of the Wisps is a 2D Metroidvania; a platform game with an emphasis on exploration, collecting items and upgrades, and backtracking to previously inaccessible areas. The player controls the titular Ori, a white guardian spirit.',
  },
  {
    title: 'Microsoft Flight Simulator',
    genre: 'Simulator',
    image: 'https://store-images.s-microsoft.com/image/apps.20786.14377492558798445.dbb01188-4892-4209-8afe-51244cbcda7e.f4e911ef-c295-4b00-b129-2f84acd134e9',
    description: 'Microsoft Flight Simulator is the next generation of one of the most beloved simulation franchises. From light planes to wide-body jets, fly highly detailed and stunning aircraft in an incredibly realistic world. Create your flight plan and fly anywhere on the planet.',
  },
  {
    title: 'Marvel\'s Avengers',
    genre: 'Action role-playing brawler',
    image: 'https://i1.wp.com/multiversitystatic.s3.amazonaws.com/uploads/2020/09/Avengers-game-cover-art-featured.jpg?fit=1000%2C1000',
    description: 'Marvel\'s Avengers is a 2020 action role-playing brawler video game developed by Crystal Dynamics and published by Square Enix\'s European subsidiary.',
  },
]

# Now insert them all into the Games table
games.each { |game| Game.create game }