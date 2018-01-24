import Vue from 'vue/dist/vue.esm';
import ElementUI from 'element-ui';
import locale from 'element-ui/lib/locale/lang/ja';
import 'element-ui/lib/theme-chalk/index.css'

import PartiesIndexView from 'views/parties/index.vue';

Vue.use(ElementUI, {locale});

// creating a new vue instance
const partiesIndex = new Vue({
    el: '#parties-index-view',
    components: {
        'parties-index-view': PartiesIndexView
    }
});
