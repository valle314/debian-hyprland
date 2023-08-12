<script setup>
    import { ref } from 'vue';
    const count = ref(0);
</script>

<template>
    <button class="button-count" @click="count++">
        Count is: {{ count }}
    </button>
</template>

<style scoped lang="scss">
.button-count
{
    background-color: yellowgreen;
    margin: 0;
    padding: 0;
    border: 10px solid white;
    border-radius: 5px;
}
</style>
