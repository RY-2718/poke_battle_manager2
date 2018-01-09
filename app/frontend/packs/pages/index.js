import Vue from 'vue/dist/vue.esm';
import ElementUI from 'element-ui';
import locale from 'element-ui/lib/locale/lang/ja';
import 'element-ui/lib/theme-chalk/index.css'

import PagesIndexView from 'views/pages/index.vue';

Vue.use(ElementUI, {locale});

// creating a new vue instance
const integrationIndex = new Vue({
    el: '#pages-index-view',
    components: {
        'pages-index-view': PagesIndexView
    }
});
