enum RequestState {
  initialState,
  webSiteLoading,
  categoryLoading,
  subCategoryLoading,
  searchLoading,
  postLoading,
  //-------------------
  insertLoading,
  updateLoading,
  deleteLoading,
  //-------------------
  webSiteLoaded,
  categoryLoaded,
  subCategoryLoaded,
  searchLoaded,
  postLoaded,
  //-------------------
  insertDone,
  updateDone,
  deleteDone,
  //-------------------
  webSiteError,
  categoryError,
  subCategoryError,
  searchError,
  postError,
  //-------------------
  insertError,
  updateError,
  deleteError
}