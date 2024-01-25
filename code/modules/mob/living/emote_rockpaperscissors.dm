//rock paper scissors emote handling
/mob/living/carbon/human/proc/beginRockPaperScissors(chosen_move)
	GLOB.rockpaperscissors_players[src] = list(chosen_move, ROCKPAPERSCISSORS_NOT_DECIDED)
	do_after_advanced(src, ROCKPAPERSCISSORS_TIME_LIMIT, src, DO_AFTER_REQUIRES_USER_ON_TURF|DO_AFTER_NO_COEFFICIENT|DO_AFTER_NO_PROGRESSBAR|DO_AFTER_DISALLOW_MOVING_ABSOLUTE_USER, CALLBACK(src, .proc/rockpaperscissors_tick))
	var/new_entry = GLOB.rockpaperscissors_players[src]
	if(new_entry[2] == ROCKPAPERSCISSORS_NOT_DECIDED)
		to_chat(src, "You put your hand back down.")
	GLOB.rockpaperscissors_players -= src

/mob/living/carbon/human/proc/rockpaperscissors_tick() //called every cycle of the progress bar for rock paper scissors while waiting for an opponent
	var/mob/living/carbon/human/opponent
	for(var/mob/living/carbon/human/potential_opponent in (GLOB.rockpaperscissors_players - src)) //dont play against yourself
		if(get_dist(src, potential_opponent) <= ROCKPAPERSCISSORS_RANGE)
			opponent = potential_opponent
			break
	if(opponent)
		//we found an opponent before they found us
		var/move_to_number = list("rock" = 0, "paper" = 1, "scissors" = 2)
		var/our_move = move_to_number[GLOB.rockpaperscissors_players[src][1]]
		var/their_move = move_to_number[GLOB.rockpaperscissors_players[opponent][1]]
		var/result_us = ROCKPAPERSCISSORS_WIN
		var/result_them = ROCKPAPERSCISSORS_LOSE
		if(our_move == their_move)
			result_us = ROCKPAPERSCISSORS_TIE
			result_them = ROCKPAPERSCISSORS_TIE
		else
			if(((our_move + 1) % 3) == their_move)
				result_us = ROCKPAPERSCISSORS_LOSE
				result_them = ROCKPAPERSCISSORS_WIN
		//we decided our results so set them in the list
		GLOB.rockpaperscissors_players[src][2] = result_us
		GLOB.rockpaperscissors_players[opponent][2] = result_them

		//show what happened
		src.visible_message("<b>[src]</b> makes [GLOB.rockpaperscissors_players[src][1]] with their hand!")
		opponent.visible_message("<b>[opponent]</b> makes [GLOB.rockpaperscissors_players[opponent][1]] with their hands!")
		switch(result_us)
			if(ROCKPAPERSCISSORS_TIE)
				src.visible_message("It was a tie!")
			if(ROCKPAPERSCISSORS_WIN)
				src.visible_message("<b>[src]</b> wins!")
			if(ROCKPAPERSCISSORS_LOSE)
				src.visible_message("<b>[opponent]</b> wins!")

		//make the progress bar end so that each player can handle the result
		return DO_AFTER_STOP

	//no opponent was found, so keep searching
	return DO_AFTER_PROCEED

//the actual emotes
/datum/emote/living/carbon/human/rockpaperscissors
	message = "is attempting to play rock paper scissors!"

/datum/emote/living/carbon/human/rockpaperscissors/rock
	key = "rock"

/datum/emote/living/carbon/human/rockpaperscissors/paper
	key = "paper"

/datum/emote/living/carbon/human/rockpaperscissors/scissors
	key = "scissors"

/datum/emote/living/carbon/human/rockpaperscissors/run_emote(mob/living/carbon/human/user, params)
	if(!(user in GLOB.rockpaperscissors_players)) //no using the emote again while already playing!
		. = ..()
		user.beginRockPaperScissors(key)
