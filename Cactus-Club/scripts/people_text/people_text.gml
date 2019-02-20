switch (chat) {
				
					case GRACE:
					
					switch o_inventory.people_i[argument0] {
					
						case people.Heather:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Great. That's what we needed. Keep his wallet and ID, it may help with questioning. His name is Wally Wiggins. Go upstairs and begin questioning. I'll be around if you need me.",1,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						global.bizi_block_ = false;
						if instance_exists(bizi_block) {
							instance_destroy(bizi_block, false);
						}
						
						break;
						
						case people.Stu:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("That's a start, but I'm going to need more information than that.",1,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Grace:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("I introduced myself already. It's Grace Anney, and you'll be working under me.",1,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Chase:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Sounds like an interesting guy. Keep an eye on him, he's got to be here for a reason.",1,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						/*case people.Stu:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("He seems like a good guy with a keen eye.",1,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;*/
						
						case people.Carrie:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("She's definitely hiding something. Make it your goal to find out what.",1,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Harold:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("He doesn't sound particularly athletic. Keep that in mind when examining his alibi.",1,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Bizi:
						case people.Eddyson:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("That is obviously bull. You must be careful when you're asking around. You can't just believe everything you hear. Go ask some people who actually know something.",1,view_xport[0]+125,view_yport[0]+250,CHEST_GRACE);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						
					}
					
					
					break;
					
					case HEATHER:
					switch o_inventory.people_i[1] {
					
						case people.Heather:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Yes, that's me. What about me?",1,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Stu:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("He's nice enough. He sometimes just looks at me for no reason though. That's weird.",1,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Dina:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Dina's an old friend. She's a sweetheart and a damn good lawyer.",1,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Chase:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("If there's one thing I can say about Chase is he's a real charmer. He's doesn't tone his flirting down even though he broke his arm.",1,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Tall:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Yes, we're dating. Engaged, actually. He bought me a ring last week.",1,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = 8;
						break;
						
					    case people.Bizi:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Don't say her name, she might appear.",1,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Carrie:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("She's stone-cold. Won't give me the time of day. I don't trust her.",1,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Ursula:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("She's... difficult. She means well... probably. Actually no, she's just a bitch.",1,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						default:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("I don't care enough to have remembered them.",1,view_xport[0]+125,view_yport[0]+250,CHEST_HEATHER);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						
					}
					break;
					
					case DINA:
					switch o_inventory.people_i[1] {
					
						case people.Heather:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("My best-est friend! We went to high school together. She's the nicest human I know!",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Stu:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("He's the barrier between me and Heather right now! Nice guy, but he needs to LET ME IN.",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Dina:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Geez, if you want to know so much ask me on a date! I’m not on chatting time!",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Chase:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("He's harmless! Under his bravado he’s just like a kid.",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = 22;
						break;
						
						case people.Tall:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("He reminds me of a vulture. Don't say that in front of Heather though.",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = 24;
						break;
						
						case people.Yasmin:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("She's very interesting...I don't get her bee thing. She keeps me up to date on all the crime dramas on TV though, so I like her.",1,view_xport[0]+125,view_yport[0]+250,CHEST_DINA);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Mikayla:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("I found an avian on the 5th floor fire escape. Could that have something to do with Wally?",1,view_xport[0]+125,view_yport[0]+250,CHEST_PROT);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = 27;
						break;
						
						
					}
					break;
					
					case EDDYSON:
					switch o_inventory.people_i[1] {
					
						
						case people.Stu:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("That man wouldn't let me inside to do a sales pitch. He's a real bully.",1,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Dina:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Tried to sell her my patented episodic Bill of Rights, receive a new Right each week! No bite though.",1,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Wendy:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("She buckled and bought a pair of earrings. Can I sell, or can I sell?",1,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						default:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("I don't know anything, care to give me their contact information?",1,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
					}
					break;
					
					case BIZI:
					switch o_inventory.people_i[1] {
					
						case people.Grace:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("That girl who here with you? I figure you know her well enough. Wink.",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = 11;
						break;
					
						
						case people.Dina:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("That lawyer? She handled fifth divorce, left bastard on the streets with just his pants. Very good lawyer.",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Heather:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("You think she owns the building how she sits at desk. Girl needs to learn to respect her elders.",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = 15;
						break;
						
						case people.Wally:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Poor dear, he was such a charming boy, so very respectful. He didn't kill himself I know it. You better find the culprit!",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Carrie:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("That girl is twitchy, always seems to have ants in her pants? Like big red fire ants. That bite.",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Yasmin:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("That's one girl who just won't shut up, she's always telling me about these dramas she watches in excruciating detail. She needs more friends her age...hey, you're still single.",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page =14;
						break;
						
						case people.Tall:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("He's not that tall but I hear he's a real charmer off the clock.",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Palmer:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("The most amazing boss of the most amazing company with the most amazing company, or so he'd like everyone to believe. Unfortunately not many people are gullible enough to fall for      	his practised speeches and borrowed words of wisdom. Good fun for a romp in the sack, if you catch my meaning.",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = 17;
						break;
						
						case people.Ursula:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("A genius who is also completely inept at anything social. Sometimes I wonder if her icy exterior is a mask for a genuinely fun person, but that seems an impossibility!",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Harold:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Such a jolly man, he would make a great mall Santa, I don't know what he's doing in that boring dead end job.",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = 20;
						break;
						
						case people.Chance:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("I would've had him and then some in my youth!",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = 24;
						break;
						
						case people.Mikayla:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Doesn't ring a bell, sorry.",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Stu:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Such a charmer! They don't make 'em like that anymore.",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Wendy:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("A little girl playing adult. Then again aren't we all a little like that?",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Peter:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Er, he's...I think he's been here a while...um...sorry, I've forgotten everything about him.",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Bizi:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("The lotus flower of the building. Wherever she walks happiness blossoms.",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = 26;
						break;
						
						case people.Eddyson:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("He runs this store down on Herald St. It's all just useless knickknacks with silly names, but I swear he uses black magic and you walk out of there with a handful of the junk! No returns!",1,view_xport[0]+125,view_yport[0]+250,CHEST_BIZI);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						default:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("I don't know anything, care to give me their contact information?",1,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
					}
					break;
					
					case people.Stu:
					switch o_inventory.people_i[1] {
					
						case people.Grace:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Seems like a nice, put-together kind of girl. That’s important in a partner.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Dina:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Heather's friend? It warms my heart to see them together, I never see Heather smile nearly as much as when she's not with Dina.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Heather:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Our newest secretary, we seem to go through them a little too fast. She's competent and respectful enough, I just wish she wasn't so guarded. I'm only trying to be friendly.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Wally:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Although he was pretty silent, it was evident he was a good guy. Hard to imagine someone wanting to hurt the fella.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Carrie:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("That girl is stressed as all hell. If she keeps taking so many smoke breaks she's going to burn herself out before she reaches forty.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = 20;
						break;
						
						case people.Yasmin:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Lovely girl. She's keen hearing about my days on the force, though sometimes she seems to fixate mainly on the violent aspects of my career for some reason.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Tall:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Can't say much about him. I just know him from afar: he doesn't seem to be interested to make friends with anyone aside from his fiancée Heather.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Palmer:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Good guy, if a little overenthusiastic. Rather a happy boss is better than a grumpy one.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Ursula:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("She's always carrying around strange equipment and  mysterious substances. It is suspicious, but doubtfully the kind of suspicious you're looking for.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Harold:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Some people are the butt of everyone's joke, Harold has the unfortunate luck of being in that select category, I've tried to tell him to stand up for himself, but fat good that's done.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = 27;
						break;
						
						case people.Chase:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("He's always smelling of smelly and expensive perfume. I don't know whether to envy or pity him.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						
						
						case people.Mikayla:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Never heard of that person.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Wendy:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("The new girl. She's so earnest and eager to prove herself. The Cullridges are a family of fortune, but she wants to start from the bottom and make a name for herself. Truly admirable. I fear someone will take advantage of her wide eyed innocence.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Peter:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("A total wallflower. He's hard to notice and easy to forget. Took me a month to remember his name.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Bizi:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("Charming woman, huh? She might be incapable of keeping silent, but she's like the building mascot.",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						case people.Eddyson:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("He sells a lot of useful stuff but you gotta be careful or you'll end up with more than you bargained for. Literally!",1,view_xport[0]+125,view_yport[0]+250,CHEST_REYNOLDS);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
						default:
						alarm[2] = global.one_second*3;
						instance_destroy(o_text,false);
						scr_text("I'm afraid I'm not too familiar with them, sorry!",1,view_xport[0]+125,view_yport[0]+250,CHEST_EDDYSON);
						//global.grace_pescatarian = true;
						alarm[0] = room_speed*.5;
						o_text.page = PAGE_END;
						break;
						
					}
					break;
}