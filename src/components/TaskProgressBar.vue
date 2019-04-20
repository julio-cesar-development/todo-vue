<template>
  <div class="task-progress">
    <span class="progress-value">{{ progress.toFixed(2) }} %</span>
    <div class="progress-bar" v-bind:style="{ 'width': `${progress}%` }"></div>
  </div>
</template>

<script>
export default {
  name: 'TaskProgressBar',
  props: {
    progress: {
      type: Number,
      default: 0,
    }
  },
}
</script>

<style scoped>
.task-progress {
  box-sizing: border-box;
  position: relative;
  width: 80vw;
  height: 20px;
  border: 1px solid #fff;
  color: #fff;
  border-radius: 8px;
  margin-bottom: 30px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  background-color: #fff2;
}

.progress-value {
  z-index: 1;
}

.progress-bar {
  position: absolute;
  border-radius: 8px;
  height: 18px;
  background-color: #4caf50;
  align-self: flex-start;
  transition: .5s;
}
</style>
