var _modelJs = require('./model.js');
var _viewsRecipeViewJs = require('./views/recipeView.js');
var _parcelHelpers = require("@parcel/transformer-js/lib/esmodule-helpers.js");
var _viewsRecipeViewJsDefault = _parcelHelpers.interopDefault(_viewsRecipeViewJs);
require('core-js/stable');
require('regenerator-runtime/runtime');
require('regenerator-runtime/runtime');
// https://forkify-api.herokuapp.com/v2
// /////////////////////////////////////
const controlRecipes = async function () {
  try {
    const id = window.location.hash.slice(1);
    console.log(id);
    if (!id) return;
    _viewsRecipeViewJsDefault.default.renderSpinner();
    // 1) Loading recipe
    await _modelJs.loadRecipe(id);
    // 2)Rendering recipe
    _viewsRecipeViewJsDefault.default.render(_modelJs.state.recipe);
  } catch (err) {
    _viewsRecipeViewJsDefault.default.renderError();
  }
};
const controlSearchResults = async function () {
  try {
    await _modelJs.loadSearchResults('pizza');
    console.log(_modelJs.state.search.results);
  } catch (err) {
    console.log(err);
  }
};
controlSearchResults();
const init = function () {
  _viewsRecipeViewJsDefault.default.addHandlerRender(controlRecipes);
};
init();
