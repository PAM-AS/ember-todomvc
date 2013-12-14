Post = DS.Model.extend
  title: DS.attr 'string'
  comments: DS.hasMany 'comment'
  user: DS.attr()

`export default Post`
