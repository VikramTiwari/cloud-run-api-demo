const express = require('express')
const helmet = require('helmet')
const cors = require('cors')

const app = express()

const geoip = require('geo-from-ip')

// default body size
const BODY_LIMIT = process.env.BODY_LIMIT || '10mb'

// add basic middlewares
app.use(helmet())
app.use(cors())
app.use(express.json({ limit: BODY_LIMIT }))
app.use(express.urlencoded({ extended: true, limit: BODY_LIMIT }))
app.set('trust proxy', true)

// for health checks
app.get('/', (req, res) => {
  res.status(200).send(req.query)
})

app.get('/geo', (req, res) => {
  const token = req.query.token
  if (token !== process.env.SECRET_TOKEN) {
    return res.status(403).send()
  }
  const ip = req.query.ip
  console.log(`Getting geo data for ip: ${ip}`)
  const geo = geoip.allData(ip)
  console.log(`Geo data for the IP: ${JSON.stringify(geo)}`)
  res.status(200).send(geo)
})

module.exports = app // for testing
