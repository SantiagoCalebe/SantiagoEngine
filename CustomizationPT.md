![FunctionsPT](https://github.com/user-attachments/assets/4a07453f-7eda-4650-8d0e-58cafeb43d5d)
<h3 align='center'>Bem vindo a SEngine</h3>

## **Tipos Básicos de Scripts LUA**

Existem **6 tipos de scripts LUA** que você pode executar:

### 1. **Stage Script**
- **Descrição:** Este script será executado apenas se o estágio da música estiver carregado no gráfico atual.
- **Localização:** Deve estar dentro de `mods/My-Mod/stages/`.
- **Exemplo:** `Stage.lua` (ou `.hx`) | `Stage.json`

### 2. **Note Type Script**
- **Descrição:** Este script será executado apenas se o Tipo de Nota especificado estiver sendo usado no gráfico atual.
- **Localização:** Deve estar dentro de `mods/My-Mod/custom_notetypes/`.
- **Exemplo:** `Note.lua` | `Note.hx`

### 3. **Event Script**
- **Descrição:** Este script será executado apenas se o Evento especificado estiver sendo usado no gráfico.
- **Localização:** Deve estar dentro de `mods/My-Mod/custom_events/`.
- **Exemplo:** `Script.lua` (ou `.hx`) | `Script.txt`

### 4. **Song Script(s)**
- **Descrição:** Este script será executado para uma música específica, independentemente da dificuldade, estágio ou outras condições.
- **Localização:** Deve ser salvo dentro da pasta do gráfico da música.
- **Exemplo:** `Script.lua` (ou `.hx`)

### 5. **Character Script**
- **Descrição:** Este script será executado se o personagem especificado for usado na música atual. 
- **Uso:** Utilize as variáveis `dadName`, `boyfriendName` e `gfName` para verificar o personagem atual.
- **Localização:** Deve estar dentro de `mods/My-Mod/characters/`.
- **Exemplo:** `Boyfriend.json` | `Boyfriend.lua` (ou `.hx`)

### 6. **General Script**
- **Descrição:** Este script será executado em todas as músicas, desde que o mod esteja carregado.
- **Localização:** Deve ser salvo dentro de `mods/My-Mod/scripts/`.
- **Exemplo:** `Script.lua` (ou `.hx`)

---

## **Modelos de Funções Básicas**

### 1. `onCreate()`
- **Descrição:** Chamado quando o arquivo lua é iniciado. Algumas variáveis ainda podem não ter sido criadas.

### 2. `onCreatePost()`
- **Descrição:** Chamado no final da fase de "criação".

### 3. `onDestroy()`
- **Descrição:** Chamado quando o arquivo lua é encerrado (fade-out da música concluído).

---

## **Interações no Jogo / Gameplay**

### 1. `onSectionHit()`
- **Descrição:** Chamado após avançar para a próxima seção.

### 2. `onBeatHit()`
- **Descrição:** Chamado 4 vezes por seção.

### 3. `onStepHit()`
- **Descrição:** Chamado 16 vezes por seção.

### 4. `onUpdate(elapsed)`
- **Descrição:** Início da fase de "atualização". Algumas variáveis ainda podem não ter sido atualizadas.

### 5. `onUpdatePost(elapsed)`
- **Descrição:** Final da fase de "atualização".

### 6. `onStartCountdown()`
- **Descrição:** O contador de início começou.
  - **Retorno:** `Function_Stop` se você quiser impedir o contador de acontecer (pode ser usado para acionar diálogos).
  - Você também pode acionar o contador manualmente com `startCountdown()`.

### 7. `onCountdownStarted()`
- **Descrição:** Chamado após o contador de início ter começado.

### 8. `onCountdownTick(counter)`
- **Descrição:** 
  - `counter = 0` → "Três"
  - `counter = 1` → "Dois"
  - `counter = 2` → "Um"
  - `counter = 3` → "Vai!"
  - `counter = 4` → Chamado ao mesmo tempo que `onSongStart`.

### 9. `onSpawnNote(id, data, type, isSustainNote, strumTime)`
- **Descrição:** Chamado quando uma nota é gerada. Você pode obter propriedades adicionais da nota (por exemplo, `getPropertyFromGroup('notes', id, 'texture')`).

### 10. `onSongStart()`
- **Descrição:** Chamado quando a música (vocais e instrumental) começa a tocar. `songPosition = 0`.

### 11. `onEndSong()`
- **Descrição:** Chamado quando a música termina ou começa a transição. 
  - **Retorno:** `Function_Stop` se você quiser impedir que a música termine (para cenas ou conquistas).

---

## **Interações de Subestado**

### 1. `onPause()`
- **Descrição:** Chamado quando você pressiona a pausa durante o jogo (não em uma cutscene).
  - **Retorno:** `Function_Stop` se você quiser impedir que o jogo seja pausado.

### 2. `onResume()`
- **Descrição:** Chamado quando o jogo é retomado após a pausa (aviso: nem sempre é proveniente da tela de pausa).

### 3. `onGameOver()`
- **Descrição:** Chamado quando sua saúde chega a zero ou abaixo (o jogador morre).
  - **Retorno:** `Function_Stop` se você quiser impedir que a tela de game over apareça.

### 4. `onGameOverConfirm(retry)`
- **Descrição:** Chamado quando você pressiona Enter/Esc na tela de Game Over.
  - Se `Esc` for pressionado, `retry` será `false`.

---

## **Modelos de Diálogo**

### 1. `onNextDialogue(line)`
- **Descrição:** Chamado quando a próxima linha de diálogo começa. As linhas de diálogo começam do número 1.

### 2. `onSkipDialogue(line)`
- **Descrição:** Chamado quando você pula uma linha de diálogo pressionando Enter. As linhas de diálogo começam do número 1.

---

## **Modelos de Entrada**

### 1. `onKeyPress(key)`
- **Descrição:** Chamado quando uma tecla é pressionada.
  - Valores de `key`: `0` = esquerda, `1` = baixo, `2` = cima, `3` = direita.

### 2. `onKeyRelease(key)`
- **Descrição:** Chamado quando uma tecla é liberada.
  - Valores de `key`: `0` = esquerda, `1` = baixo, `2` = cima, `3` = direita.

### 3. `onGhostTap(key)`
- **Descrição:** Chamado quando um ghost tap é registrado (quando nenhuma nota está presente para ser atingida).
  - Valores de `key`: `0` = esquerda, `1` = baixo, `2` = cima, `3` = direita.

---

## **Modelos de Acerto / Falha de Nota**

### **Funções Precedentes ao Acerto:**

1. `goodNoteHitPre(id, direction, noteType, isSustainNote)`
   - **Descrição:** Chamado antes dos cálculos de acerto de nota.
   - `id`: O id do membro da nota.
   - `noteData`: `0` = esquerda, `1` = baixo, `2` = cima, `3` = direita.
   - `noteType`: O tipo de nota.
   - `isSustainNote`: Se for uma nota sustentada (verdadeiro ou falso).

2. `opponentNoteHitPre(id, direction, noteType, isSustainNote)`
   - **Descrição:** Chamado quando o oponente acerta uma nota, antes dos cálculos.
   - Mesmos parâmetros de `goodNoteHitPre`.

---

### **Funções Posteriores ao Acerto:**

1. `goodNoteHit(id, direction, noteType, isSustainNote)`
   - **Descrição:** Chamado após o jogador acertar uma nota.
   - Mesmos parâmetros de `goodNoteHitPre`.

2. `opponentNoteHit(id, direction, noteType, isSustainNote)`
   - **Descrição:** Chamado após o oponente acertar uma nota.
   - Mesmos parâmetros de `goodNoteHitPre`.

3. `noteMissPress(direction)`
   - **Descrição:** Chamado após o cálculo de falha de nota (quando uma tecla foi pressionada, mas nenhuma nota foi acertada).

4. `noteMiss(id, direction, noteType, isSustainNote)`
   - **Descrição:** Chamado quando o jogador erra uma nota (a nota sai da tela).

---

## **Outras Funções**

### 1. `onRecalculateRating()`
- **Descrição:** Chamado quando a recalculação da avaliação é iniciada.
  - **Retorno:** `Function_Stop` se você quiser controlar a avaliação manualmente.
  - Use `setRatingPercent()` para definir a porcentagem da avaliação e `setRatingString()` para definir a descrição da avaliação.

### 2. `onMoveCamera(focus)`
- **Descrição:** Chamado quando o foco da câmera muda.
  - **Valores de foco:** 
    - `focus == 'boyfriend'` → A câmera foca no namorado.
    - `focus == 'dad'` → A câmera foca no pai.

---

## **Modelos de Notas de Evento**

### 1. `onEvent(name, value1, value2, strumTime)`
- **Descrição:** Chamado quando uma nota de evento é acionada.

### 2. `onEventPushed(name, value1, value2, strumTime)`
- **Descrição:** Chamado para cada nota de evento. Recomenda-se pré-carregar os assets.

### 3. `eventEarlyTrigger(name)`
- **Descrição:** Porta de gatilho antecipado para eventos personalizados em Lua.

---

## **Funções de Subestado Personalizado**

### 1. `onCustomSubstateCreate(name)`
- **Descrição:** Chamado quando um subestado personalizado é criado.

### 2. `onCustomSubstateCreatePost(name)`
- **Descrição:** Chamado após a criação de um subestado personalizado.

### 3. `onCustomSubstateUpdate(name, elapsed)`
- **Descrição:** Chamado a cada frame durante a atualização de um subestado personalizado.

### 4. `onCustomSubstateUpdatePost(name, elapsed)`
- **Descrição:** Chamado após a atualização de um subestado personalizado.

### 5. `onCustomSubstateDestroy(name)`
- **Descrição:** Chamado quando um subestado personalizado é destruído.
  - **`name`** é definido em `closeCustomSubstate()`.

---

## **Modelos de Timer**

### 1. `onTweenCompleted(tag)`
- **Descrição:** Chamado quando uma animação de tween é concluída.
  - **Tag:** A tag dada ao tween.

### 2. `onTimerCompleted(tag, loops, loopsLeft)`
- **Descrição:** Chamado quando um timer é concluído.
  - **Loops:** Número total de loops completados.
  - **LoopsLeft:** Número de loops restantes.

### 3. `onSoundFinished(tag)`
- **Descrição:** Chamado quando um som iniciado com `playSound()` termina.

