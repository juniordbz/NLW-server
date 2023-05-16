import { PrismaClient } from '@prisma/client'
import fastify from 'fastify'

const prisma = new PrismaClient()

const app = fastify()

app.get('/users', async () => {
  const users = await prisma.users.findMany()
  return users
})

app
  .listen({
    port: 3333,
  })
  .then(() => {
    console.log('HTTP server running on port:3333')
  })
