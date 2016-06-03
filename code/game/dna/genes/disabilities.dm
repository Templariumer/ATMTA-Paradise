/////////////////////
// DISABILITY GENES
//
// These activate either a mutation, disability, or sdisability.
//
// Gene is always activated.
/////////////////////

/datum/dna/gene/disability
	name="DISABILITY"

	// Mutation to give (or 0)
	var/mutation=0

	// Disability to give (or 0)
	var/disability=0

	// SDisability to give (or 0)
	var/sdisability=0

	// Activation message
	var/activation_message=""

	// Ура, у тебя не растёт третья рука!
	var/deactivation_message=""

/datum/dna/gene/disability/can_activate(var/mob/M,var/flags)
	return 1 // Always set!

/datum/dna/gene/disability/activate(var/mob/M, var/connected, var/flags)
	if(mutation && !(mutation in M.mutations))
		M.mutations.Add(mutation)
	if(disability)
		M.disabilities|=disability
	if(sdisability)
		M.sdisabilities|=sdisability
	if(activation_message)
		to_chat(M, "\red [activation_message]")
	else
		testing("[name] has no activation message.")

/datum/dna/gene/disability/deactivate(var/mob/M, var/connected, var/flags)
	if(mutation && (mutation in M.mutations))
		M.mutations.Remove(mutation)
	if(disability)
		M.disabilities &= ~disability
	if(sdisability)
		M.sdisabilities &= ~sdisability
	if(deactivation_message)
		to_chat(M, "\red [deactivation_message]")
	else
		testing("[name] has no deactivation message.")

/datum/dna/gene/disability/hallucinate
	name="Hallucinate"
	activation_message="Разум говорит тебе "КУКУСИКИ""
	deactivation_message ="Разум вернулся... Или нет?"
	mutation=HALLUCINATE

	New()
		block=HALLUCINATIONBLOCK

/datum/dna/gene/disability/epilepsy
	name="Epilepsy"
	activation_message="Голова болит..."
	deactivation_message ="Головная боль прошла, наконец-то"
	disability=EPILEPSY

	New()
		block=EPILEPSYBLOCK

/datum/dna/gene/disability/cough
	name="Coughing"
	activation_message="Глотка чешется."
	deactivation_message ="Глотка перестает чесаться."
	disability=COUGHING

	New()
		block=COUGHBLOCK

/datum/dna/gene/disability/clumsy
	name="Clumsiness"
	activation_message="У тебя появилось чувство неуклюжести."
	deactivation_message ="У тебя вернулся контроль к твоим движениям"
	mutation=CLUMSY

	New()
		block=CLUMSYBLOCK

/datum/dna/gene/disability/tourettes
	name="Tourettes"
	activation_message="Ты трясешься."
	deactivation_message ="Как-будто язык мылом отмыли"
	disability=TOURETTES

	New()
		block=TWITCHBLOCK

/datum/dna/gene/disability/nervousness
	name="Nervousness"
	activation_message="Ты нервничаешь."
	deactivation_message ="Ты чувствуешь себя гораздо спокойнее."
	disability=NERVOUS

	New()
		block=NERVOUSBLOCK

/datum/dna/gene/disability/blindness
	name="Blindness"
	activation_message="Кажется, ты ослеп."
	deactivation_message ="Теперь ты можешь видеть, если ты ещё не заметил..."
	sdisability=BLIND

	New()
		block=BLINDBLOCK

/datum/dna/gene/disability/deaf
	name="Deafness"
	activation_message="Стало как-то тихо."
	deactivation_message ="Ты снова можешь видеть!"
	sdisability=DEAF

	New()
		block=DEAFBLOCK

	activate(var/mob/M, var/connected, var/flags)
		..(M,connected,flags)
		M.ear_deaf = 1

/datum/dna/gene/disability/nearsighted
	name="Nearsightedness"
	activation_message="С твоими глазами что-то не так..."
	deactivation_message ="Зрение снова стало нормальным."
	disability=NEARSIGHTED

	New()
		block=GLASSESBLOCK


/datum/dna/gene/disability/lisp
	name = "Lisp"
	desc = "Интерфна, фто ето делает."
	activation_message = "Фто-то яфно не так."
	deactivation_message = "Ты снова можешь нормально говорить."
	mutation = LISP

	New()
		..()
		block=LISPBLOCK

	OnSay(var/mob/M, var/message)
		return replacetext(message,"s","th")

/datum/dna/gene/disability/comic
	name = "Comic"
	desc = "Это принесёт только смерть и разрушения."
	activation_message = "<span class='sans'>Ой-Ой!</span>"
	deactivation_message = "Хвала Аллаху, это закончилось."
	mutation=COMIC

	New()
		block = COMICBLOCK
