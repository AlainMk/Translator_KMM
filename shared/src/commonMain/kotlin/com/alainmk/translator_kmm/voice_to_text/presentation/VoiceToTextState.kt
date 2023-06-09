package com.alainmk.translator_kmm.voice_to_text.presentation

data class VoiceToTextState(
    val powerRatios: List<Float> = emptyList(),
    val spokenText: String = "",
    val canRecord: Boolean = true,
    val recordError: String? = null,
    val displayState: DisplayState? = null
)

enum class DisplayState {
    WAITING_TO_TALK,
    SPEAKING,
    DISPLAYING_RESULTS,
    ERROR
}
