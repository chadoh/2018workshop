import React, { Component } from 'react'
import { graphql } from 'react-apollo'
import gql from 'graphql-tag'

import { FEED_QUERY } from './LinkList'

class CreateLink extends Component {
  state = {
    description: '',
    url: '',
  }

  render() {
    return (
      <form onSubmit={e => { e.preventDefault(); this._createLink() }}>
        <h2>New Link</h2>
        <div className="flex flex-column mt3">
          <label>
            Description
            <input
              className="mb2"
              value={this.state.description}
              onChange={e => this.setState({ description: e.target.value })}
              type="text"
            />
          </label>
          <label>
            URL
            <input
              className="mb2"
              value={this.state.url}
              onChange={e => this.setState({ url: e.target.value })}
              type="text"
            />
          </label>
        </div>
        <button>Submit</button>
      </form>
    )
  }

  _createLink = async e => {
    const { description, url } = this.state
    await this.props.postMutation({
      variables: { description, url },
      update: (store, { data: { post } }) => {
        const data = store.readQuery({ query: FEED_QUERY })
        data.feed.links.splice(0, 0, post)
        store.writeQuery({
          query: FEED_QUERY,
          data,
        })
      },
    })
    this.props.history.push('/')
  }
}

const POST_MUTATION = gql`
  mutation PostMutation($description: String!, $url: String!) {
    post(description: $description, url: $url) {
      id
      createdAt
      url
      description
    }
  }
`

export default graphql(POST_MUTATION, { name: 'postMutation' })(CreateLink)
