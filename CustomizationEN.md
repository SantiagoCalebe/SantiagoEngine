![Functions](https://github.com/user-attachments/assets/24f58ef8-1863-40ac-81e6-613d076593db)

<h3 align='center'>A Welcome to SEngine</h3>

## **Basic Types of LUA Scripts**

There are **6 types of LUA Scripts** you can run:

### 1. **Stage Script**
- **Description:** This script will only run if the song's stage is loaded in the current chart.
- **Location:** Should be inside `mods/My-Mod/stages/`.
- **Example:** `Stage.lua` (or `.hx`) | `Stage.json`

### 2. **Note Type Script**
- **Description:** This script will only run if the specified Note Type is being used in the current chart.
- **Location:** Should be inside `mods/My-Mod/custom_notetypes/`.
- **Example:** `Note.lua` | `Note.hx`

### 3. **Event Script**
- **Description:** This script will only run if the specified Event is being used in the chart.
- **Location:** Should be inside `mods/My-Mod/custom_events/`.
- **Example:** `Script.lua` (or `.hx`) | `Script.txt`

### 4. **Song Script(s)**
- **Description:** This script runs for a specific song, regardless of difficulty, stage, or other conditions.
- **Location:** Should be saved inside the song’s chart folder.
- **Example:** `Script.lua` (or `.hx`)

### 5. **Character Script**
- **Description:** This script will run if the specified character is used in the current song. 
- **Usage:** Use variables `dadName`, `boyfriendName`, and `gfName` to check the current character.
- **Location:** Should be inside `mods/My-Mod/characters/`.
- **Example:** `Boyfriend.json` | `Boyfriend.lua` (or `.hx`)

### 6. **General Script**
- **Description:** This script runs in every song as long as the mod is loaded.
- **Location:** Should be saved inside `mods/My-Mod/scripts/`.
- **Example:** `Script.lua` (or `.hx`)

---

## **Basic Functions Templates**

### 1. `onCreate()`
- **Description:** Triggered when the lua file is started. Some variables may not be created yet.

### 2. `onCreatePost()`
- **Description:** Called at the end of the "create" phase.

### 3. `onDestroy()`
- **Description:** Triggered when the lua file is ended (Song fade-out finished).

---

## **Gameplay / In-Game Interactions**

### 1. `onSectionHit()`
- **Description:** Triggered after advancing to the next section.

### 2. `onBeatHit()`
- **Description:** Triggered 4 times per section.

### 3. `onStepHit()`
- **Description:** Triggered 16 times per section.

### 4. `onUpdate(elapsed)`
- **Description:** Start of "update". Some variables may not be updated yet.

### 5. `onUpdatePost(elapsed)`
- **Description:** End of "update".

### 6. `onStartCountdown()`
- **Description:** Countdown started.
  - **Return:** `Function_Stop` if you want to stop the countdown (can be used to trigger dialogues).
  - You can also trigger the countdown manually with `startCountdown()`.

### 7. `onCountdownStarted()`
- **Description:** Called after the countdown has started.

### 8. `onCountdownTick(counter)`
- **Description:** 
  - `counter = 0` → "Three"
  - `counter = 1` → "Two"
  - `counter = 2` → "One"
  - `counter = 3` → "Go!"
  - `counter = 4` → Triggered at the same time as `onSongStart`.

### 9. `onSpawnNote(id, data, type, isSustainNote, strumTime)`
- **Description:** Triggered when a note is spawned. You can get additional note properties (e.g., `getPropertyFromGroup('notes', id, 'texture')`).

### 10. `onSongStart()`
- **Description:** Called when vocals and instrumental start playing. `songPosition = 0`.

### 11. `onEndSong()`
- **Description:** Called when the song ends or transitions start. 
  - **Return:** `Function_Stop` if you want to stop the song from ending (for cutscenes or achievements).

---

## **Substate Interactions**

### 1. `onPause()`
- **Description:** Called when you press pause during gameplay (not in a cutscene).
  - **Return:** `Function_Stop` if you want to prevent the game from being paused.

### 2. `onResume()`
- **Description:** Called after the game is resumed from a pause (warning: not necessarily from the pause screen).

### 3. `onGameOver()`
- **Description:** Called when your health is zero or lower (player dies).
  - **Return:** `Function_Stop` if you want to prevent the game over screen.

### 4. `onGameOverConfirm(retry)`
- **Description:** Triggered when you press Enter/Esc on the Game Over screen.
  - If `Esc` is pressed, `retry` will be `false`.

---

## **Dialogue Templates**

### 1. `onNextDialogue(line)`
- **Description:** Triggered when the next dialogue line starts. Dialogue line numbers start from 1.

### 2. `onSkipDialogue(line)`
- **Description:** Triggered when you skip a dialogue line by pressing Enter. Dialogue line numbers start from 1.

---

## **Input Templates**

### 1. `onKeyPress(key)`
- **Description:** Called when a key is pressed.
  - `key` values: `0` = left, `1` = down, `2` = up, `3` = right.

### 2. `onKeyRelease(key)`
- **Description:** Called when a key is released.
  - `key` values: `0` = left, `1` = down, `2` = up, `3` = right.

### 3. `onGhostTap(key)`
- **Description:** Triggered when a ghost tap is registered (when no note is present to hit).
  - `key` values: `0` = left, `1` = down, `2` = up, `3` = right.

---

## **Note Hit / Miss Templates**

### **Pre-Hit Functions:**

1. `goodNoteHitPre(id, direction, noteType, isSustainNote)`
   - **Description:** Called before note hit calculations.
   - `id`: The note member id.
   - `noteData`: `0` = left, `1` = down, `2` = up, `3` = right.
   - `noteType`: The note type string.
   - `isSustainNote`: True if it's a sustain note.

2. `opponentNoteHitPre(id, direction, noteType, isSustainNote)`
   - **Description:** Called when the opponent hits a note, before calculations.
   - Same parameters as `goodNoteHitPre`.

---

### **Post-Hit Functions:**

1. `goodNoteHit(id, direction, noteType, isSustainNote)`
   - **Description:** Called after the player hits a note.
   - Same parameters as `goodNoteHitPre`.

2. `opponentNoteHit(id, direction, noteType, isSustainNote)`
   - **Description:** Called after the opponent hits a note.
   - Same parameters as `goodNoteHitPre`.

3. `noteMissPress(direction)`
   - **Description:** Triggered after a miss is calculated (when a key was pressed but no note was hit).

4. `noteMiss(id, direction, noteType, isSustainNote)`
   - **Description:** Called when the player misses a note (it goes off-screen).

---

## **Other Function Templates**

### 1. `onRecalculateRating()`
- **Description:** Triggered when recalculating the rating.
  - **Return:** `Function_Stop` if you want to handle the rating calculation manually.
  - Use `setRatingPercent()` to set the calculated rating percentage and `setRatingString()` for the rating description.

### 2. `onMoveCamera(focus)`
- **Description:** Triggered when the camera focus changes.
  - **Focus values:** 
    - `focus == 'boyfriend'` → Camera focuses on the boyfriend.
    - `focus == 'dad'` → Camera focuses on the dad.

---

## **Event Notes Templates**

### 1. `onEvent(name, value1, value2, strumTime)`
- **Description:** Triggered when an event note is activated.
  - `TriggerEvent()` does **not** call this function.

### 2. `onEventPushed(name, value1, value2, strumTime)`
- **Description:** Called for every event note. It’s recommended to precache assets here.

### 3. `eventEarlyTrigger(name)`
- **Description:** Used to adjust the timing of event triggers (e.g., triggering an event earlier for synchronization).

---

## **Custom Substates Templates**

### 1. `onCustomSubstateCreate(name)`
- **Description:** Triggered when a custom substate is created.
  - `name` is defined in `openCustomSubstate(name)`.

### 2. `onCustomSubstateCreatePost(name)`
- **Description:** Triggered post-creation of a custom substate.

### 3. `onCustomSubstateUpdate(name, elapsed)`
- **Description:** Triggered every frame during a custom substate update.
  - `elapsed`: Time in seconds since the last frame.

### 4. `onCustomSubstateUpdatePost(name, elapsed)`
- **Description:** Triggered after a custom substate update.

### 5. `onCustomSubstateDestroy(name)`
- **Description:** Called when a custom substate is destroyed.
  - `name` is defined in `closeCustomSubstate()`.

---

## **Timer Templates**

### 1. `onTweenCompleted(tag)`
- **Description:** Called when a tween animation finishes.
  - **Tag:** The tag given to the tween.

### 2. `onTimerCompleted(tag, loops, loopsLeft)`
- **Description:** Called when a timer completes.
  - `Loops`: Number of loops completed.
  - `LoopsLeft`: Remaining loops.

### 3. `onSoundFinished(tag)`
- **Description:** Called when a sound, triggered by `playSound()` with a tag, finishes.
