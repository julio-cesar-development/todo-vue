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
  components: {

  },
  directives: {},
  filters: {},
  mixins: [],
  props: {

  },
  data() {
    return {
      name: '',
    }
  },
  computed: {

  },
  watch: {},
  beforeCreate() {},
  created() {},
  beforeMount() {},
  mounted() {
    const input = document.querySelector('.form-input');
    if (input) {
      input.focus();
    }
  },
  beforeUpdate() {},
  updated() {},
  activated() {},
  deactivated() {},
  beforeDestroy() {},
  destroyed() {},
  methods: {
    addTask() {
      if (this.name) {
        // console.log(this.name); // eslint-disable-line
        this.$emit('task-added', { 'name' : this.name });
        this.clear();
      }
    },
    clear() {
      this.name = '';
    },
  },
}
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
