<template>
  <div class="q-pa-md">
    <q-table
      ref="myTable"
      :class="tableClass"
      :dense="$q.screen.lt.sm"
      color="blue-8"
      tabindex="0"
      title="Treats"
      :data="data"
      :columns="columns"
      row-key="name"
      :pagination.sync="pagination"
      hide-pagination
      selection="multiple"
      :selected.sync="selected"
      :filter="filter"
      @focusin.native="activateNavigation"
      @focusout.native="deactivateNavigation"
      @keydown.native="onKey"
    >
      <template v-slot:top-right>
        <q-input
          borderless
          dense
          debounce="300"
          v-model="filter"
          placeholder="Search"
        >
          <template v-slot:append>
            <q-icon name="search" />
          </template>
        </q-input>
      </template>
      <template v-slot:body="props">
        <q-tr :props="props">
          <q-td key="calories" :props="props">
            {{ props.calories}}
          </q-td>
          <q-td  key="calories" auto-width>
            <q-btn
              color="blue"
              label="Kết thúc"
              size="md"
              no-caps
              style="margin-right: 16px; width: 64px"
            ></q-btn>
            <!-- @click="confirm(props.row)" -->

            <q-btn color="red" label="Xóa" size="md" no-caps></q-btn>
          </q-td>
        </q-tr>
      </template>
    </q-table>
    <div class="row justify-center q-mt-md">
      <q-pagination
        v-model="pagination.page"
        color="grey-8"
        :max="pagesNumber"
        size="sm"
      />
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      descending: false,
      page: 2,
      rowsPerPage: 3,
      navigationActive: false,
      filter: "",
      selected: [],
      pagination: {},
      columns: [
        {
          name: "name",
          required: true,
          label: "Dessert (100g serving)",
          align: "left",
          field: (row) => row.name,
          format: (val) => `${val}`,
          sortable: true,
        },
        {
          name: "calories",
          align: "center",
          label: "Calories",
          field: "calories",
          sortable: true,
        },
        { name: "fat", label: "Fat (g)", field: "fat", sortable: true },
        { name: "carbs", label: "Carbs (g)", field: "carbs" },
        { name: "protein", label: "Protein (g)", field: "protein" },
        { name: "sodium", label: "Sodium (mg)", field: "sodium" },
        {
          name: "calcium",
          label: "Calcium (%)",
          field: "calcium",
          sortable: true,
          sort: (a, b) => parseInt(a, 10) - parseInt(b, 10),
        },
        {
          name: "iron",
          label: "Iron (%)",
          field: "iron",
          sortable: true,
          sort: (a, b) => parseInt(a, 10) - parseInt(b, 10),
        },
      ],
      data: [
        {
          name: "Frozen Yogurt",
          details:
            "A frozen dessert made with yogurt and sometimes other dairy products including non-dairy products",
          calories: 159,
          fat: 6.0,
          carbs: 24,
          protein: 4.0,
          sodium: 87,
          calcium: "14%",
          iron: "1%",
        },
        {
          name: "Ice cream sandwich",
          details:
            "A frozen dessert consisting of ice cream between two skins, crusts, or other similar biscuit",
          calories: 237,
          fat: 9.0,
          carbs: 37,
          protein: 4.3,
          sodium: 129,
          calcium: "8%",
          iron: "1%",
        },
        {
          name: "Eclair",
          details:
            "An oblong pastry made with choux dough filled with a cream and topped with chocolate icing",
          calories: 262,
          fat: 16.0,
          carbs: 23,
          protein: 6.0,
          sodium: 337,
          calcium: "6%",
          iron: "7%",
        },
        {
          name: "Cupcake",
          details:
            "A small cake designed to serve one person, which may be baked in a small thin paper or aluminum cup",
          calories: 305,
          fat: 3.7,
          carbs: 67,
          protein: 4.3,
          sodium: 413,
          calcium: "3%",
          iron: "8%",
        },
        {
          name: "Gingerbread",
          details:
            "A broad category of baked goods, typically flavored with ginger, cloves, nutmeg or cinnamon and sweetened with honey, sugar or molasses",
          calories: 356,
          fat: 16.0,
          carbs: 49,
          protein: 3.9,
          sodium: 327,
          calcium: "7%",
          iron: "16%",
        },
        {
          name: "Jelly bean",
          details:
            "Small bean-shaped sugar candies with soft candy shells and thick gel interiors",
          calories: 375,
          fat: 0.0,
          carbs: 94,
          protein: 0.0,
          sodium: 50,
          calcium: "0%",
          iron: "0%",
        },
        {
          name: "Lollipop",
          details:
            "A type of sugar candy usually consisting of hard candy mounted on a stick and intended for sucking or licking",
          calories: 392,
          fat: 0.2,
          carbs: 98,
          protein: 0,
          sodium: 38,
          calcium: "0%",
          iron: "2%",
        },
        {
          name: "Honeycomb",
          details:
            "A mass of hexagonal prismatic wax cells built by honey bees in their nests to contain their larvae and stores of honey and pollen",
          calories: 408,
          fat: 3.2,
          carbs: 87,
          protein: 6.5,
          sodium: 562,
          calcium: "0%",
          iron: "45%",
        },
        {
          name: "Donut",
          details: "A type of fried dough confection or dessert food",
          calories: 452,
          fat: 25.0,
          carbs: 51,
          protein: 4.9,
          sodium: 326,
          calcium: "2%",
          iron: "22%",
        },
        {
          name: "KitKat",
          details: `A chocolate-covered wafer bar confection created by Rowntree's of York, United Kingdom, and is now produced globally by Nestlé`,
          calories: 518,
          fat: 26.0,
          carbs: 65,
          protein: 7,
          sodium: 54,
          calcium: "12%",
          iron: "6%",
        },
      ],
    };
  },
  computed: {
    tableClass() {
      return this.navigationActive === true ? "shadow-8 no-outline" : void 0;
    },
    pagesNumber() {
      return this.data.length / 5;
    },
  },
  methods: {
    activateNavigation() {
      this.navigationActive = true;
    },
    deactivateNavigation() {
      this.navigationActive = false;
    },
    onKey(evt) {
      if (
        this.navigationActive !== true ||
        [33, 34, 35, 36, 38, 40].indexOf(evt.keyCode) === -1 ||
        this.$refs.myTable === void 0
      ) {
        return;
      }
      evt.preventDefault();
      const { computedRowsNumber, computedRows } = this.$refs.myTable;
      if (computedRows.length === 0) {
        return;
      }
      const currentIndex =
        this.selected.length > 0 ? computedRows.indexOf(this.selected[0]) : -1;
      const currentPage = this.pagination.page;
      const rowsPerPage =
        this.pagination.rowsPerPage === 0
          ? computedRowsNumber
          : this.pagination.rowsPerPage;
      const lastIndex = computedRows.length - 1;
      const lastPage = Math.ceil(computedRowsNumber / rowsPerPage);
      let index = currentIndex;
      let page = currentPage;
      switch (evt.keyCode) {
        case 36: // Home
          page = 1;
          index = 0;
          break;
        case 35: // End
          page = lastPage;
          index = rowsPerPage - 1;
          break;
        case 33: // PageUp
          page = currentPage <= 1 ? lastPage : currentPage - 1;
          if (index < 0) {
            index = 0;
          }
          break;
        case 34: // PageDown
          page = currentPage >= lastPage ? 1 : currentPage + 1;
          if (index < 0) {
            index = rowsPerPage - 1;
          }
          break;
        case 38: // ArrowUp
          if (currentIndex <= 0) {
            page = currentPage <= 1 ? lastPage : currentPage - 1;
            index = rowsPerPage - 1;
          } else {
            index = currentIndex - 1;
          }
          break;
        case 40: // ArrowDown
          if (currentIndex >= lastIndex) {
            page = currentPage >= lastPage ? 1 : currentPage + 1;
            index = 0;
          } else {
            index = currentIndex + 1;
          }
          break;
      }
      if (page !== this.pagination.page) {
        this.pagination = {
          ...this.pagination,
          page,
        };
        this.$nextTick(() => {
          const { computedRows } = this.$refs.myTable;
          this.selected = [
            computedRows[Math.min(index, computedRows.length - 1)],
          ];
        });
      } else {
        this.selected = [computedRows[index]];
      }
    },
  },
};
</script>

<style>
.my-table-details {
  font-size: 0.85em;
  font-style: italic;
  max-width: 200px;
  white-space: normal;
  color: #555;
  margin-top: 4px;
}
</style>
