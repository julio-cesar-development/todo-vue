<template>
  <div class="task-new">
    <input v-model="name"
      type="text"
      class="form-input"
      placeholder="Nova tarefa"
      autofocus
      v-on:keyup.enter="addTask()"
      v-on:keyup.esc="clear()"
    >
    <button type="button" class="btn" v-on:click.stop="addTask()">+</button>
  </div>
</template>

<script>
export default {
  name: 'TaskNew',
  data() {
    return {
      name: '',
    };
  },
  mounted() {
    const input = document.querySelector('.form-input');
    if (input) {
      input.focus();
    }
  },
  methods: {
    addTask() {
      if (this.name) {
        this.$emit('task-added', { name: this.name });
        this.clear();
      }
    },
    clear() {
      this.name = '';
    },
  },
};
</script>

<style scoped>
.task-new {
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  flex-wrap: wrap;
  margin-bottom: 20px;
}
</style>
